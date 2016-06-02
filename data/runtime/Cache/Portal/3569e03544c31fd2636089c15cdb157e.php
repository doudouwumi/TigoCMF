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
	<link rel="icon" href="/ThinkCMFtigo/themes/maje/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/ThinkCMFtigo/themes/maje/Public/images/favicon.ico" type="image/x-icon">
    		
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="/ThinkCMFtigo/themes/maje/Public/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/ThinkCMFtigo/themes/maje/Public/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<script src="/ThinkCMFtigo/themes/maje/Public/js/jquery-1.11.0.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="/ThinkCMFtigo/themes/maje/Public/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/ThinkCMFtigo/themes/maje/Public/js/move-top.js"></script>
<script type="text/javascript" src="/ThinkCMFtigo/themes/maje/Public/js/easing.js"></script>
<link rel="stylesheet" type="text/css" href="/ThinkCMFtigo/themes/maje/Public/css/common.css" />
<link rel="stylesheet" type="text/css" href="/ThinkCMFtigo/themes/maje/Public/css/style4.css" />
<script type="text/javascript" src="/ThinkCMFtigo/themes/maje/Public/js/modernizr.custom.79639.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<style>*{font-family: 微软雅黑}</style>


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
       <a class="brand" href="/ThinkCMFtigo/"><img src="/ThinkCMFtigo/themes/maje/Public/images/logo.png"/></a>
       <div class="nav-collapse collapse" id="main-menu">
       	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target' class='dropdown-toggle' data-toggle='dropdown'>\$label <b class='caret'></b></a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); ?>
		
		<ul class="nav pull-right" id="main-menu-user">
			<li class="dropdown user login">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	            <img src="/ThinkCMFtigo/themes/maje//Public/images/headicon.png" class="headicon"/>
	            <span class="user-nicename"></span><b class="caret"></b></a>
	            <ul class="dropdown-menu pull-right">
	               <li><a href="<?php echo U('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
	               <li class="divider"></li>
	               <li><a href="<?php echo U('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
	            </ul>
          	</li>
          	<li class="dropdown user offline">
	            <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	           		<img src="/ThinkCMFtigo/themes/maje//Public/images/headicon.png" class="headicon"/>登录<b class="caret"></b>
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
				<a href="index.html"><img src="/ThinkCMFtigo/themes/maje/Public/images/logo-2.png" alt=""></a>
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
	<!--banner-starts-->
			<?php $home_slides=sp_getslide("portal_index"); ?>
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
   <?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><li data-target="#carousel-example-generic" data-slide-to="<?php echo ($k); ?>" class="<?php if($k==0){echo "active";}?>"></li><?php endforeach; endif; ?> 
  </ol>

  <!-- Wrapper for slides -->
 

  <div class="carousel-inner">


 <?php if(is_array($home_slides)): foreach($home_slides as $k=>$vo): ?><div class="<?php if($k==0){echo "item active";}else{echo "item";}?>">
      <img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt="">
 
    </div><?php endforeach; endif; ?> 


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>


	<!--banner-ends--> 
	<!--FlexSlider-->

	<link rel="stylesheet" href="/ThinkCMFtigo/themes/maje/Public/css/flexslider.css" type="text/css" media="screen" />
	<script defer src="/ThinkCMFtigo/themes/maje/Public/js/jquery.flexslider.js"></script>
	<script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
</div>
			<!--End-slider-script-->
    
		<div class="container">
			<div class="welcome-top">
				<h1>慧谦文化</h1>
				<p> 一家致力于学习，交流和传播中华传统文化的年轻企业<br/>热情积极，成熟干练的专业团队<br/>聚集了众多业内知名的文化人士，努力打造精致的文化产品</p>
			</div>
			<div class="welcome-bottom">
				<div class="col-md-6 welcome-left">
					<h3>国学经典</h3>
					<p>古往今来的中华人都注重修身立命，何谓修身，参通天、地、人三者也，何谓立命，诚明正心，执守道本以顺天命。论语编写于春秋，千百年来，其中通俗易懂，鞭辟入里的哲论引导着无数的华夏人走出蒙昧，安身立命，直至造福苍生。就这点来说，论语成为了世代国人的启蒙教材，其在中国历史上的重要性无可替代。</p>
					<div class="welcome-one">
						<div class="col-md-6 welcome-one-left">
							<a href="javascript:void(0)"><img src="/ThinkCMFtigo/themes/maje/Public/images/1.jpg" alt="" /></a>
						</div>
						<div class="col-md-6 welcome-one-right">
							<a href="javascript:void(0)"><img src="/ThinkCMFtigo/themes/maje/Public/images/2.jpg" alt="" /></a>
							<a href="javascript:void(0)" class="one-top"><img src="/ThinkCMFtigo/themes/maje/Public/images/3.jpg" alt="" /></a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-6 welcome-left">
					<h3>人生•智慧</h3>
					<p>我们倡导大家重新拾起论语，因为论语的智慧重在礼教，重在明每个人在家庭，社会中的关系，学习品读它，不仅是为了从小让子女知道父母的伟大，教会子女去爱戴父母，也为让父母重新建立起家庭观念，认识到自身对孩子发展的重要意义，唯有如此才能达到家庭和谐的纯粹目的。</p>
					<div class="welcome-one">
						<a href="javascript:void(0)"><img src="/ThinkCMFtigo/themes/maje/Public/images/4.jpg" alt="" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>

	<!--welcome-ends--> 
	<!--offer-starts-->
	<div class="offer">
		<div class="container">
			<div class="offer-top heading">
				<h2>慧谦服务</h2>
			</div>
			<div class="offer-bottom">
			
			
  					
		<?php
$tag='cid:9;field:tid,post_title,post_keywords,post_excerpt,smeta;order:listorder asc'; $project=sp_sql_posts($tag); $i=1; ?>

			<?php if(is_array($project)): $i = 0; $__LIST__ = array_slice($project,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
				<div class="col-md-3 offer-left">
					<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="" />
					<!-- <h6>$29</h6> --></a>
					<h4 style="font-size:16px;"><a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><?php echo ($vo["post_title"]); ?></a></h4>
					<p style="font-size:13px">
					<?php  $str =explode('$$$',$vo[post_keywords]); echo implode("<br/>",$str); ?>
					</p>
					<div class="o-btn">
						<a href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>">了解</a>
					</div>
				</div><?php endforeach; endif; else: echo "" ;endif; ?>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--offer-ends--> 
	<!--nature-starts--> 
	<!-- <div class="nature">
		<div class="container">
			<div class="nature-top">
				<h3>Maecenas ornare lobortis</h3>
				<p>Phasellus tempor erat id erat gravida pulvinar. Aenean est felis, ullamcorper et volutpat sed, cursus at enim. Vestibulum vel finibus neque. In sed magna tellus.</p>
			</div>
		</div>
	</div> -->
	<!--nature-ends--> 
	<!--field-starts--> 
<!-- 	<div class="fields">
		<div class="container">
			<div class="fields-top">
				<div class="col-md-4 fields-left">
					<span class="home"></span>
					<h4>Vestibulum vel finibus</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="col-md-4 fields-left">
					<span class="men"></span>
					<h4>Quisque non ligula</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="col-md-4 fields-left">
					<span class="pen"></span>
					<h4>Lorem ipsum dolor</h4>
					<p>Pellentesque sed sem bibendum, rutrum ipsum vitae, facilisis turpis. Mauris vitae metus gravida, hendrerit erat ac, facilisis ligula.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div> -->
	<!--field-end--> 
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
					<img style="width:110px;height:96px;float:left;margin-right:15px;" src="/ThinkCMFtigo/themes/maje/Public/images/logo-2.png" alt="">
					<ul>
		<?php
$tag='cid:9;field:tid,post_title,post_keywords,post_excerpt,smeta;order:listorder asc'; $project=sp_sql_posts($tag); $i=1; ?>
			<?php if(is_array($project)): $i = 0; $__LIST__ = array_slice($project,0,4,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a style="color:#fff;font-size:13px" href="<?php echo U('portal/article/index',array('id'=>"$vo[tid]"));?>"><li><?php echo ($vo["post_title"]); ?></li>
					</a><?php endforeach; endif; else: echo "" ;endif; ?>
					</ul>
				</div>
				<div class="col-md-3 footer-left">
					<h3>公众号关注</h3>
					<img style="width:100px;height:100px;float:left;margin-right:15px;" src="/ThinkCMFtigo/themes/maje/Public/images/qrcode_for_gh_7a493b385b46_258.jpg" alt="">
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