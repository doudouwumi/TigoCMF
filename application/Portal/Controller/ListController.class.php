<?php
// +----------------------------------------------------------------------
// | TIGO [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.tigonetwork.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController;
/**
 * 文章列表
*/
class ListController extends HomebaseController {

	//文章内页
	public function index() {


// //
//    		$commentsCount=M("comments");
//         $posts=M('posts');

//         $postsCount=$commentsCount
//         ->alias("a")
//         ->join(C ( 'DB_PREFIX' )."posts b ON a.id = b.post_id")
//         ->where("post_id=id")
//         ->count();

//         $this->assign("company_profile",$postsCount);


//         //
      


//公司简介
         $jianjielink=M("posts");
        $term_relationships_model=M('term_relationships');
        $terms=M('terms');

        $posts=$term_relationships_model
        ->alias("a")
        ->join(C ( 'DB_PREFIX' )."posts b ON a.object_id = b.id")
        ->where("term_id = 8 and post_status =1")
        ->field('id,post_title,smeta,post_excerpt')
        
        ->order("a.listorder ASC,b.post_modified DESC")->select();

	
        $this->assign("company_profile",$posts);

//
//
     //公司简介 4个文章
     $posts_4=$jianjielink->where("id>33 AND id<38")->order("id ASC")->select();
     $this->assign("posts_4",$posts_4);

		$term=sp_get_term($_GET['id']);
		
		if(empty($term)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		    	
		    return ;
		}
		
		$tplname=$term["list_tpl"];
    	$tplname=sp_get_apphome_tpl($tplname, "list");
    	$this->assign($term);
    	$this->assign('cat_id', intval($_GET['id']));
    	$this->display(":$tplname");
	}
	
	public function nav_index(){
		$navcatname="文章分类";
		$datas=sp_get_terms("field:term_id,name");
		$navrule=array(
				"action"=>"List/index",
				"param"=>array(
						"id"=>"term_id"
				),
				"label"=>"name");
		exit(sp_get_nav4admin($navcatname,$datas,$navrule));
		
	}
	
}
