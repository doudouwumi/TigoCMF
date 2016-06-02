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

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/thinkcmftigo/themes/maje/Public/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/thinkcmftigo/themes/maje/Public/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<script src="/thinkcmftigo/themes/maje/Public/js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="/thinkcmftigo/themes/maje/Public/js/bootstrap.min.js"></script>
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
<style>*{font-family: 微软雅黑}</style><script type="text/javascript" src="/thinkcmftigo/themes/maje/Public/js/modernizr.custom.79639.js"></script>
<!---- start-smoth-scrolling---->
</head>

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
	<!--about-starts--> 
	<div class="about">
		
<div class="container">
<?php
$tag='cid:9;field:tid,post_title,post_excerpt,smeta;order:listorder asc'; $project=sp_sql_posts($tag); $i=1; ?>
			<div class="about-top heading">
				<h1>关于慧谦</h1>
				<h4>慧谦文化传播有限公司简介</h4>
				<p>慧谦文化传播有限公司成立于2013年，位于广东省东莞市，是一家致力于学习，交流和传播中华传统文化的年轻企业。朝气与活力是公司的名片，创新与进取则是公司的灵魂。长期以来，公司培养打造了一支热情积极，成熟干练的专业团队，聚集了众多业内知名的文化人士，努力打造精致的文化产品，涉及学龄前培训，传统文化教育，培训以及咨询服务，传统中医学的养生保健服务，中华传统文化对外交流等。</p>
				<div class="about-bottom">
					

					<?php if(is_array($project)): $i = 0; $__LIST__ = array_slice($project,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
		
					<div class="col-md-3 about-left">
						<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>
						"><img style="width:250px;height:200px" src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="" /></a>
						<center><h5 style="font-size:16px"><a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><?php echo ($vo["post_title"]); ?></a></h5></center>
					<!-- 	<p><?php echo ($vo["post_excerpt"]); ?></p> -->
					</div><?php endforeach; endif; else: echo "" ;endif; ?>
					<div class="clearfix"></div>
				</div>
			</div>



		</div>
	</div>
	<!----about-end---->
	<!--advantages-starts--> 
	<div class="advantages" style="margin-top:20px">
		<div class="container">
			<div class="col-md-6 advantages-left heading">
				<h2>我们的项目</h2>
				<div class="advn-one">



						<div class="ad-mian">
						<?php if(is_array($project)): $i = 0; $__LIST__ = array_slice($project,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="ad-left">
								<p><?php echo $i; ?></p>
							</div>
							<div class="ad-right">
								<h4><a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><?php echo ($vo["post_title"]); ?></a></h4>
								<p><?php echo ($vo["post_excerpt"]); ?></p>
							</div>
							<div class="clearfix"></div><?php endforeach; endif; else: echo "" ;endif; ?>	
						</div>
			




					</div>
			</div>
			<!-- <div class="col-md-6 advantages-left heading">
				<h3>OUR 优势</h3>
			<div class="advn-two">
						<h4>Erci eu tincidunt lacinia, elit quam ultri ces ipsum, quis ultricies ipsum ante</h4>
						<p>Donec sagittis interdum tellus sed bibendum. Aen ean fringilla ut lacus eu vehicula. Curabitur non nibh quis nisi vestibulum aliquet non sed dolor. Ut est risus, consectetur sit amet pretium in, cursus in dui. Donec ac rhoncus libero.</p>
						<ul>
							<li><a href="#">Praesent vestibulum molestie lacus</a></li>
							<li><a href="#">Donec sagittis interdum tellus</a></li>
							<li><a href="#">Nulla consectetur adipiscing</a></li>
							<li><a href="#">Donec ac rhoncus libero.</a></li>
							<li><a href="#">Erci eu tincidunt lacinia</a></li>
						</ul>
			</div>
			</div> -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!--advantages-end--> 
	<!--team-starts--> 
	<div class="team">
		<div class="container">
			<div class="team-top heading">
				<h3>我们的团队</h3>
			</div>

			<?php
$tag='cid:10;field:tid,post_title,post_source,smeta;order:listorder asc'; $teacher=sp_sql_posts($tag); ?>
			<div class="team-bottom">
				<ul class="ch-grid">
					<?php if(is_array($teacher)): $i = 0; $__LIST__ = array_slice($teacher,0,3,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $teacher_smeta=json_decode($vo['smeta'],true); ?>
					<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>
						"><li>
						<div class="ch-item" style="cursor:pointer;background-image:url(<?php echo sp_get_asset_upload_path($teacher_smeta['thumb']);?>);">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front" style="background-image:url(<?php echo sp_get_asset_upload_path($teacher_smeta['thumb']);?>);">	</div>
									<div class="ch-info-back">
										<h3><?php echo ($vo["post_title"]); ?></h3>
										<p>by <?php echo ($vo["post_source"]); ?></p>
									</div>	
								</div>
							</div>
						</div>
					</li>
					</a><?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
			</div>
		</div>
	</div>
	<!--team-end--> 
	<!--footer-starts--> 
<div class="footer">
		
<?php echo hook('footer');?>

<div class="container">
			<div class="footer-top">
				<div class="col-md-5 footer-left" >
					<p style="font-size:15px">慧谦文化传播</p>
					<br/>
					<p style="font-size:13px">一家致力于学习,交流和传播中华传统文化的年轻企业,培养打造了一支热情积极,熟练干练的专业团队,聚集了众多内知名文化人士,努力打造精致的文化产品。</p>
					<br/>
					<p style="font-size:13px">电话：0769-22633863</p>
					<p style="font-size:13px">邮箱: 865175936@qq.com</p>
					<p style="font-size:13px">地址: 广东东莞市中国东莞留学人员创业园</p>
				</div>
				<div class="col-md-4 footer-left">
					<h3>慧谦服务</h3>
					<!-- <ul>
						<li><a href="#"><span class="fb"> </span></a></li>
						<li><a href="#"><span class="twit"> </span></a></li>
						<li><a href="#"><span class="google"> </span></a></li>
						<li><a href="#"><span class="pin"> </span></a></li>
					</ul> -->
					<img style="width:110px;height:96px;float:left;margin-right:15px;" src="/thinkcmftigo/themes/maje/Public/images/logo-2.png" alt="">
					<ul>
		<?php
$tag='cid:9;field:tid,post_title,post_keywords,post_excerpt,smeta;order:listorder asc'; $project=sp_sql_posts($tag); $i=1; ?>
			<?php if(is_array($project)): $i = 0; $__LIST__ = array_slice($project,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a style="color:#fff;font-size:13px" href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><li><?php echo ($vo["post_title"]); ?></li>
					</a><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
				<div class="col-md-3 footer-left">
					<h3>公众号关注</h3>
					<img style="width:100px;height:100px;float:left;margin-right:15px;" src="/thinkcmftigo/themes/maje/Public/images/qrcode_for_gh_7a493b385b46_258.jpg" alt="">
					<p>关注慧谦文化公众号 
					<span>及时获取企业相关动态</span>
					</p>
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