<?php
namespace Comment\Controller;
use Common\Controller\HomebaseController;
class MycommentController extends HomebaseController{
	/**
	 * YHX 20160519 新增个人定制的评论控制器
	 * 由于评论不需要会员登录 所以继承了HomebaseController
	 * @var [type]
	 */
	protected $comments_model;
	
	function _initialize() {
		parent::_initialize();
		$this->comments_model=D("Common/Comments");
	}
	
	function index(){
		$uid=sp_get_current_userid();
		$where=array("uid"=>$uid);
		
		$count=$this->comments_model->where($where)->count();
		
		$page=$this->page($count,20);
		$page->setLinkWraper("li");
		
		$comments=$this->comments_model->where($where)
		->order("createtime desc")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		
		$this->assign("pager",$page->show("default"));
		$this->assign("comments",$comments);
		$this->display(":index");
	}
	
	function post(){
		if (IS_POST){
			 
			// if(!sp_check_verify_code()){
			// 	$this->error("验证码不正确");
			// }
			$name = $_POST['full_name'];
			$email = $_POST['email'];
			$subject = $_POST['subject'];
			$content = $_POST['content'];
			//校验数据
			if($name=="Name" || $email=="Email" || $subject=="Subject" || $content=="Message" ){
				$this->error("请填写完整的信息");
			}
			if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
				$this->error("邮箱格式错误");
			}

			// $post_table=sp_authcode($_POST['post_table']);
			// yhx 默认为posts
			$post_table='posts';
			
			$_POST['post_table']=$post_table;
			
			// $url=parse_url(urldecode($_POST['url']));
			// $query=empty($url['query'])?"":"?{$url['query']}";
			// $url="{$url['scheme']}://{$url['host']}{$url['path']}$query";
			// dump($_POST);die();
			$url="http://".$_SERVER['HTTP_HOST'].U('portal/article/index',array("id"=>$_POST['post_id']));
			$_POST['url']=sp_get_relative_url($url);
			
			//yhx 20160519 注释
			// if(isset($_SESSION["user"])){//用户已登陆,且是本站会员
			// 	$uid=$_SESSION["user"]['id'];
			// 	$_POST['uid']=$uid;
			// 	$users_model=M('Users');
			// 	$user=$users_model->field("user_login,user_email,user_nicename")->where("id=$uid")->find();
			// 	$username=$user['user_login'];
			// 	$user_nicename=$user['user_nicename'];
			// 	$email=$user['user_email'];
			// 	$_POST['full_name']=empty($user_nicename)?$username:$user_nicename;
			// 	$_POST['email']=$email;
			// }
			
			//yhx包装数据
			// $_POST['createtime'] = date("Y-m-d H:i:s");
			// $_POST['type'] = 2;//评论类型；1实名评论, 2自定义评论
			// dump($_POST);die();
			if(C("COMMENT_NEED_CHECK")){
				$_POST['status']=0;//评论审核功能开启
			}else{
				$_POST['status']=1;
			}
			
			if ($this->comments_model->create()){
				$this->check_last_action(intval(C("COMMENT_TIME_INTERVAL")));
				$result=$this->comments_model->add();
				if ($result!==false){
					
					//评论计数
					$post_table=ucwords(str_replace("_", " ", $post_table));
					$post_table=str_replace(" ","",$post_table);
					$post_table_model=M($post_table);
					$pk=$post_table_model->getPk();
					
					$post_table_model->create(array("comment_count"=>array("exp","comment_count+1")));
					$post_table_model->where(array($pk=>intval($_POST['post_id'])))->save();
					
					$post_table_model->create(array("last_comment"=>time()));
					$post_table_model->where(array($pk=>intval($_POST['post_id'])))->save();
					
					// $this->ajaxReturn(sp_ajax_return(array("id"=>$result),"评论成功！",1));
					$this->success("评论成功！");
				} else {
					$this->error("评论失败！");
				}
			} else {
				$this->error($this->comments_model->getError());
			}
		}
		
	}
}