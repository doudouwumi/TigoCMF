<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/ThinkCMFtigo/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/ThinkCMFtigo/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/ThinkCMFtigo/public/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/ThinkCMFtigo/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/ThinkCMFtigo/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/ThinkCMFtigo/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/ThinkCMFtigo/public/js/jquery.js"></script>
    <script src="/ThinkCMFtigo/public/js/wind.js"></script>
    <script src="/ThinkCMFtigo/public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
</head>
<body>
	<div class="wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<?php echo U('guestbookadmin/index');?>"><?php echo L('API_GUESTBOOKADMIN_INDEX');?></a></li>
		</ul>
		<form method="post" class="js-ajax-form">
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th width="50">ID</th>
						<th width="100"><?php echo L('NAME');?></th>
						<th width="150"><?php echo L('EMAIL');?></th>
						<th style="min-width: 60px;">电话号码</th>
						<th><?php echo L('CONTENT');?></th>
						<th width="120"><?php echo L('TIME');?></th>
						<th width="120"><?php echo L('ACTIONS');?></th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($guestmsgs)): foreach($guestmsgs as $key=>$vo): ?><tr>
						<td><?php echo ($vo["id"]); ?></td>
						<td><?php echo ($vo["full_name"]); ?></td>
						<td><?php echo ($vo["email"]); ?></td>
						<td><?php echo ($vo["title"]); ?></td>
						<td><?php echo ($vo["msg"]); ?></td>
						<td><?php echo ($vo["createtime"]); ?></td>
						<td>
							<a href="<?php echo U('guestbookadmin/delete',array('id'=>$vo['id']));?>" class="js-ajax-delete"><?php echo L('DELETE');?></a>
						</td>
					</tr><?php endforeach; endif; ?>
				</tbody>
			</table>
			<div class="pagination"><?php echo ($Page); ?></div>
		</form>
	</div>
	<script src="/ThinkCMFtigo/public/js/common.js?"></script>
</body>
</html>