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
 * 首页
 */
class IndexController extends HomebaseController {
	
    //首页
    //
    //
    //
    //


	public function index() {
		$term_relationships_model=M('term_relationships');
		$projectCount = $term_relationships_model->where('term_id=8')->count();
		$this->assign("projectCount",$projectCount);

    	$this->display(":index");

    }

}


