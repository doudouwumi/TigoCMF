<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html>
<html>


<head>
		<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
		<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
		<meta name="description" content="<?php echo ($site_seo_description); ?>">
			<?php  function _sp_helloworld(){ echo "hello TIGO!"; } function _sp_helloworld2(){ echo "hello TIGO2!"; } function _sp_helloworld3(){ echo "hello TIGO3!"; } ?>
	<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"TIGOX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"TIGOX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"TIGOX2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta name="author" content="TIGO">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/thinkcmftigo/themes/maje/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/thinkcmftigo/themes/maje/Public/images/favicon.ico" type="image/x-icon">
    		
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Majestic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/thinkcmftigo/themes/maje/Public/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/thinkcmftigo/themes/maje/Public/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<script src="/thinkcmftigo/themes/maje/Public/js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="/thinkcmftigo/themes/maje/Public/js/move-top.js"></script>
<script type="text/javascript" src="/thinkcmftigo/themes/maje/Public/js/easing.js"></script>
<link rel="stylesheet" type="text/css" href="/thinkcmftigo/themes/maje/Public/css/common.css" />
<link rel="stylesheet" type="text/css" href="/thinkcmftigo/themes/maje/Public/css/style4.css" />
<script type="text/javascript" src="/thinkcmftigo/themes/maje/Public/js/modernizr.custom.79639.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!---- start-smoth-scrolling---->
</head>
<body>
	<!----start-header---->
	<div class="header" id="home">
		<?php echo hook('body_start');?>
<!-- <div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container">
       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </a>
       <a class="brand" href="/thinkcmftigo/"><img src="/thinkcmftigo/themes/maje/Public/images/logo.png"/></a>
       <div class="nav-collapse collapse" id="main-menu">
       	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
		
		<ul class="nav pull-right" id="main-menu-user">
			<li class="dropdown user login">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	            <img src="/thinkcmftigo/themes/maje//Public/images/headicon.png" class="headicon"/>
	            <span class="user-nicename"></span><b class="caret"></b></a>
	            <ul class="dropdown-menu pull-right">
	               <li><a href="<?php echo U('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
	               <li class="divider"></li>
	               <li><a href="<?php echo U('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
	            </ul>
          	</li>
          	<li class="dropdown user offline">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	           		<img src="/thinkcmftigo/themes/maje//Public/images/headicon.png" class="headicon"/>登录<b class="caret"></b>
	            </a>
	            <ul class="dropdown-menu pull-right">
	               <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
	               <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li>
	               <li><a href="<?php echo leuu('user/login/index');?>"><i class="fa fa-sign-in"></i> &nbsp;登录</a></li>
	               <li class="divider"></li>
	               <li><a href="<?php echo leuu('user/register/index');?>"><i class="fa fa-user"></i> &nbsp;注册</a></li>
	            </ul>
          	</li>
		</ul>
		<div class="pull-right">
        	<form method="post" class="form-inline" action="<?php echo U('portal/search/index');?>" style="margin:18px 0;">
				 <input type="text" class="" placeholder="Search" name="keyword" value="<?php echo I('get.keyword');?>"/>
				 <input type="submit" class="btn btn-info" value="Go" style="margin:0"/>
			</form>
		</div>
       </div>
     </div>
   </div>
 </div> -->


 <div class="container">
			<div class="logo">
				<a href="index.html"><img src="/thinkcmftigo/themes/maje/Public/images/logo-2.png" alt=""></a>
			</div>
			<div class="navigation" >
			<?php  $id=$_REQUEST['id']; ?>

			 <span class="menu" ></span> 
				<ul class="navig" >
					<li><a  href="<?php echo ($site_host); ?>index.html">首页</a><span> </span></li><!-- class="active" -->
					<li><a href="<?php echo ($site_host); ?>index.php?m=list&a=index&id=3" >公司介绍</a><span> </span></li>
					<li><a href="<?php echo ($site_host); ?>index.php?m=list&a=index&id=4">新闻中心</a><span> </span></li>
					<!-- <li><a href="<?php echo ($site_host); ?>index.php?m=list&a=index&id=5">Pages</a><span> </span></li> -->
					<li><a href="<?php echo ($site_host); ?>index.php?m=list&a=index&id=6">活动展示</a><span> </span></li>
					<li><a href="<?php echo ($site_host); ?>index.php?m=page&a=index&id=1">联系我们</a><span> </span></li>
				</ul>
				<!--    	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a  href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="" ; $li_class="" ; $style="navig"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?> -->


			</div>
				 <!-- script-for-menu -->
		 <script>
				$("span.menu").click(function(){
					$(" ul.navig").slideToggle("slow" , function(){
					});
				});
		 </script>
		 <!-- script-for-menu -->
		</div>
		
	</div>	
	<!----end-header---->
	<!--blog-->
	<div class="blog">
		<div class="container">
			<div class="blog-head heading">
			
			</div>	
			<div class="blog-top">
				<div class="col-md-9 blog-left">
					<div class="blog-main">
						<a href="single.html" class="bg">DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE</a>
						<p>Post by <a href="javascript:void(0)"><?php echo ($user_nicename); ?></a> on <?php echo date("l,M d,Y" ,strtotime($post_modified) ); ?>  
						<a href="javascript:void(0)"><?php echo ($lastCommentsCount); ?> comments</a></p>

						
					</div>
					<div class="blog-main-one">
						<div class="blog-one">
							<img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="" />
							<p><?php echo ($post_content); ?></p>
						</div>	
						<!-- <div class="blog-comments">
							<ul>
								<li><span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span><a href="#">Uncategorized</a></li>
								<li><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span><p>March 13,2014</p></li>
								<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span><a href="#">Admin</a></li>
							</ul>
							<div class="clearfix"></div>
						</div>	 -->
					</div>
					<div class="comments">
						<div class="comments-top heading">
							<h3>COMMENTS</h3>
						</div>
						<div class="comments-bottom">
							<div class="media">
								<?php if(empty($lastComments)){ ?>
								<div class="media">
									<div class="media-body">
										<h4 class="media-heading"><a href="javascript:void(0)">暂时还没评论!</a></h4>
									</div>
								</div>
								<?php } ?>
								<?php if(is_array($lastComments)): $i = 0; $__LIST__ = array_slice($lastComments,0,3,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="media">
									
									<div class="media-body">
										<h4 class="media-heading"><a href="javascript:void(0)"><?php echo ($vo["full_name"]); ?></a></h4>
										<p style="padding-left:5px "><?php echo ($vo["content"]); ?></p>
									</div>
									</div><?php endforeach; endif; else: echo "" ;endif; ?>


								</div>
					</div>
				</div>
				<div class="related heading">
							<h3>RELATED POSTS</h3>




<?php $hot_articles=sp_sql_posts("$portal_index_lastnews;field:post_title,post_excerpt,tid,smeta;order:post_hits desc;limit:4;"); ?>
							<div class="related-bottom">
							<?php if(is_array($hot_articles)): foreach($hot_articles as $key=>$vo): $smetaa=json_decode($vo['smeta'],true); ?>
								<div class="col-md-3 related-left">
									<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><img src="<?php echo sp_get_asset_upload_path($smetaa['thumb']);?>" alt="" /></a>
									<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><h4><?php echo ($vo["post_title"]); ?></h4></a>
								</div><?php endforeach; endif; ?>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="reply heading">
					 		<h3>LEAVE A COMMENT</h3>




					 		<div class="contact-form">
								<form class="js-ajax-form" role="form" method="post" action="<?php echo U('comment/mycomment/post');?>">									<input name="full_name" type="text" placeholder="姓名" required/>
									<input name="email" type="text" placeholder="邮箱" required/>
									<input type="text" name="phone" placeholder="电话号码" required/>
									<textarea name="content" placeholder="内容"></textarea>
									<input type="hidden" name="post_id" value="<?php echo $_GET['id'];?>"/>
									<input type="submit" value="POST"/>
				   				</form>
				   			</div>	
						</div>
				</div>
				<!-- <div class="col-md-3 blog-right">
					<div class="categories">
						<h3>CATEGORIES</h3>
						<ul>
							<li><a href="#">Aenean tortor orci</a></li>
							<li><a href="#">Duis bibendum pellentesquev</a></li>
							<li><a href="#">Quisque pharetra semper</a></li>
							<li><a href="#">Cras condimentum risus</a></li>
							<li><a href="#"> Quisque id erat sapien</a></li>
						</ul>
					</div>
					<div class="categories">
						<h3>RECENT POSTS</h3>
						<ul>
							<li><a href="#">Fusce id volutpat est</a></li>
							<li><a href="#">Phasellus condimentum odio</a></li>
							<li><a href="#">Donec interdum eros elit</a></li>
							<li><a href="#">Cras condimentum risus</a></li>
							<li><a href="#">Proin sodales diam ac </a></li>
						</ul>
					</div>
					<div class="categories">
						<h3>ARCHIVES</h3>
						<ul>
							<li><a href="#">March 3014</a></li>
							<li><a href="#">May 2014</a></li>
							<li><a href="#">August 2014</a></li>
							<li><a href="#">October 2014</a></li>
						</ul>
					</div>
				</div> -->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--blog-->
	<!--footer-starts--> 
<div class="footer">
		
<?php echo hook('footer');?>

<div class="container">
			<div class="footer-top">
				<div class="col-md-4 footer-left">
					<p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
				</div>
				<div class="col-md-4 footer-left">
					<h3>Follow Us</h3>
					<ul>
						<li><a href="#"><span class="fb"> </span></a></li>
						<li><a href="#"><span class="twit"> </span></a></li>
						<li><a href="#"><span class="google"> </span></a></li>
						<li><a href="#"><span class="pin"> </span></a></li>
					</ul>
				</div>
				<div class="col-md-4 footer-left">
					<h3>Address</h3>
					<p>The company name, 
					<span>Lorem ipsum dolor,</span>
					Glasglow Dr 40 Fe 72.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
	<!--footer-ends--> 
</body>
</html>