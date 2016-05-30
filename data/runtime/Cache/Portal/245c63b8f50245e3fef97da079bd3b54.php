<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
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
	<!--light-box-files -->
		<script src="/thinkcmftigo/themes/maje/Public/js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="/thinkcmftigo/themes/maje/Public/css/chocolat.css" type="text/css" media="screen" charset="utf-8" />
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		$(function() {
			$('.gallery-bottom a').Chocolat();
		});
		</script>
	<!--gallery-starts--> 
	<div class="gallery">
		<div class="container">
			<div class="gallery-top heading">
				<h1>OUR GALLERY</h1>
			</div>
			<div class="gallery-bottom">
			<?php $pagetpl="{prev}{liststart}{list}{listend}{next}";$lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;order:listorder desc;",12,$pagetpl); ?>
			<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
					<div class="col-md-3 gallery-left" style="margin-bottom:30px">
						<a href="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>">
							<img style="width:250px;height:200px" class="lazyOwl" src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="name" />
						</a>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>	
			</div>
			
		</div>
		<center>
		<div class="pagination" style="margin:0 auto">
				<nav>
  					<ul class="pager">
    					<?php echo ($lists["page"]); ?>
    				</ul>
				</nav>
			</div>
			</center>
	</div>	
	
	<!----gallery-end---->
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