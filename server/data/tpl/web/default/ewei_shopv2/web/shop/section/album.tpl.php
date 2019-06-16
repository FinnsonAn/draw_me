<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<?php  if($_W['method'] == 'album') { ?>
<div class="page-heading"> 
    <span class='pull-right'>
        <?php if(cv('shop.section.add')) { ?>
        	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('shop/section/albumEdit', array('sid' => $sid))?>"><i class='fa fa-plus'></i> 添加图位</a>
        <?php  } ?>
    </span>
    <h2>图位管理</h2> 
</div>

<form action="./index.php" method="get" class="form-horizontal form-search" role="form">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
    <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r"  value="shop.section.album" />
    <div class="page-toolbar row m-b-sm m-t-sm">
        <div class="col-sm-4">
            <div class="input-group-btn">
                <button class="btn btn-default btn-sm"  type="button" data-toggle='refresh'><i class='fa fa-refresh'></i></button>
                <?php if(cv('shop.section.edit')) { ?>
                	<button class="btn btn-default btn-sm" type="button" data-toggle='batch' data-href="<?php  echo webUrl('shop/section/enabled',array('enabled'=>1))?>"><i class='fa fa-circle'></i> 显示</button>
                	<button class="btn btn-default btn-sm" type="button" data-toggle='batch'  data-href="<?php  echo webUrl('shop/section/enabled',array('enabled'=>0))?>"><i class='fa fa-circle-o'></i> 隐藏</button>
                <?php  } ?>
                <?php if(cv('shop.section.delete')) { ?>	
                	<button class="btn btn-default btn-sm" type="button" data-toggle='batch-remove' data-confirm="确认要删除?" data-href="<?php  echo webUrl('shop/section/delete')?>"><i class='fa fa-trash'></i> 删除</button>
                <?php  } ?>
            </div> 
        </div>	

        <div class="col-sm-6 pull-right">

            <select name="enabled" class='form-control input-sm select-sm'>
                <option value="" <?php  if($_GPC['enabled'] == '') { ?> selected<?php  } ?>>状态</option>
                <option value="1" <?php  if($_GPC['enabled']== '1') { ?> selected<?php  } ?>>显示</option>
                <option value="0" <?php  if($_GPC['enabled'] == '0') { ?> selected<?php  } ?>>隐藏</option>
            </select>	
             <select name='sid' class='form-control input-sm select-sm' style="width:150px;">
                          <option value="">
                            版块
                          </option>
                          <?php  if(is_array($sections)) { foreach($sections as $row) { ?>
                          <option value="<?php  echo $row['sid'];?>" <?php  if($_GPC['sid']==$row['sid']) { ?>selected="selected"<?php  } ?>><?php  echo $row['section_name'];?></option>
                          <?php  } } ?>
                        </select>
            <div class="input-group">				 
                <input type="text" class="input-sm form-control" name='keyword' value="<?php  echo $_GPC['keyword'];?>" placeholder="请输入关键词"> 
                <span class="input-group-btn">
                	<button class="btn btn-sm btn-primary" type="submit"> 搜索</button> 
                </span>
            </div>
        </div>
        
    </div>
</form>

<form action="" method="post">
    <?php  if(count($list)>0) { ?>
    <table class="table table-responsive table-hover" >
        <thead class="navbar-inner">
            <tr>
                <th style="width:25px;"><input type='checkbox' /></th>
                <th style="width:80px;">显示顺序</th>			
                <th width="20%">图位名称</th>
                <th width="20%">标题<br>副标题</th>
                <th>关联的数据ID</th>
                <th>尺寸</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <?php  if(is_array($list)) { foreach($list as $row) { ?>
            <tr>
                <td>
                    <input type='checkbox'   value="<?php  echo $row['item_id'];?>"/>
                </td>
                <td>
                    <?php if(cv('shop.section.edit')) { ?>
                    	<a href='javascript:;' data-toggle='ajaxEdit' data-href="<?php  echo webUrl('shop/section/albumOrder',array('id'=>$row['item_id']))?>" ><?php  echo $row['displayorder'];?></a>
                    <?php  } else { ?>
                    	<?php  echo $row['displayorder'];?> 
                    <?php  } ?>
                </td>
                <td><?php  if($row['thumb']) { ?><img src="<?php  echo $row['thumb'];?>" height="40px;" width="auto;"><br><?php  } ?><?php  echo $row['name'];?></td>
                <td><?php  echo $row['title'];?><br><?php  echo $row['assistant_title'];?></td>
                <td><span class='label label-success'><?php  echo $row['data_id'];?></span></td>
                <td>宽:<?php  echo $row['width'];?><br>高：<?php  echo $row['height'];?></td>
                <td>
                	<span class='label <?php  if($row['enabled']==1) { ?>label-success<?php  } else { ?>label-default<?php  } ?>' 
                          <?php if(cv('shop.section.edit')) { ?>
	                          data-toggle='ajaxSwitch' 
	                          data-switch-value='<?php  echo $row['enabled'];?>'
	                          data-switch-value0='0|隐藏|label label-default|<?php  echo webUrl('shop/section/albumEnabled',array('enabled'=>1,'id'=>$row['item_id']))?>'  
	                          data-switch-value1='1|显示|label label-success|<?php  echo webUrl('shop/section/albumEnabled',array('enabled'=>0,'id'=>$row['item_id']))?>'  
                          <?php  } ?> >
                          <?php  if($row['enabled']==1) { ?>显示<?php  } else { ?>隐藏<?php  } ?>
                    </span>
                </td> 
                <td style="text-align:left;">
                        
                        <?php if(cv('shop.section.view|shop.section.edit')) { ?>
                        	<a href="<?php  echo webUrl('shop/section/albumEdit', array('id' => $row['item_id'], 'sid' => $sid))?>" class="btn btn-default btn-sm" >
                        		<i class='fa fa-edit'></i> <?php if(cv('shop.section.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>
                        	</a>
                        <?php  } ?>
                        
                        <?php if(cv('shop.section.delete')) { ?>
                        	<br><a data-toggle='ajaxRemove' href="<?php  echo webUrl('shop/section/albumDel', array('id' => $row['item_id'], 'sid' => $sid))?>" class="btn btn-default btn-sm" data-confirm='确认要删除此图位吗?'><i class="fa fa-trash"></i> 删除</a>
                        <?php  } ?>
                        
                </td>
            </tr>
                <?php  } } ?> 
                <tr>
                    <td colspan='8'>
                        <div class='pagers' style='float:right;'>
                            <?php  echo $pager;?>			
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <?php  echo $pager;?>
        <?php  } else { ?>
        <div class='panel panel-default'>
            <div class='panel-body' style='text-align: center;padding:30px;'>
                暂时没有任何图位!
            </div>
        </div>
        <?php  } ?>
    </form>
<?php  } else { ?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('shop.section.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('shop/section/albumEdit')?>">添加新图位</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('shop/section/album', array('sid' => $sid))?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['item_id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>图位 <small><?php  if(!empty($item['item_id'])) { ?>修改【<?php  echo $item['name'];?>】<?php  } ?></small></h2> 
</div>
 
    <form <?php if( ce('shop.section' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['item_id'];?>" />
                <div class="form-group">
                    <label class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('shop.section' ,$item) ) { ?>
                                <input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                                <span class='help-block'>数字越大，排名越靠前</span>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">图位名称</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        	<input type="text" id='name' name="name" class="form-control" value="<?php  echo $item['name'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['name'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">标题</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        	<input type="text" id='title' name="title" class="form-control" value="<?php  echo $item['title'];?>" />
                            <span class="help-block">显示在网页上的主要文字</span>
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['title'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">副标题</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        	<input type="text" id='assistant_title' name="assistant_title" class="form-control" value="<?php  echo $item['assistant_title'];?>" />
                            <span class="help-block">显示在网页上的描述文字</span>
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['assistant_title'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">所属版块</label>
                    <div class="col-sm-9 col-xs-12">
                        <select class="form-control" name="section_id" id="section_id">
                            <option value="">请选择</option>
                            <?php  if(is_array($sections)) { foreach($sections as $v) { ?>
                            <option value="<?php  echo $v['sid'];?>"<?php  if($item['section_id']==$v['sid'] || $sid == $v['sid']) { ?> selected<?php  } ?>><?php  echo $v['section_name'];?><?php  if($v['type']) { ?>(<?php  echo $v['type'];?>)<?php  } ?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">图片</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
	                        <?php  echo tpl_form_field_image('thumb', $item['thumb'])?>
                        <?php  } else { ?>
                            <?php  if(!empty($item['thumb'])) { ?>
                            	<a href='<?php  echo tomedia($item['thumb'])?>' target='_blank'>
                            		<img src="<?php  echo tomedia($item['thumb'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
                            	</a>
                            <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">背景颜色</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='bgcolor' name="bgcolor" class="form-control" value="<?php  echo $item['bgcolor'];?>" />
                        <div class='form-control-static'><span class="color-box" <?php  if($item['bgcolor']) { ?>style='background:<?php  echo $item['bgcolor'];?>'<?php  } ?>></span></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">尺寸</label>
                    <div class="col-sm-9 col-xs-12">
                        宽度：<input type="text" id='width' name="width" value="<?php  echo $item['width'];?>" />px &nbsp; 
                        高度： <input type="text" id='height' name="height" value="<?php  echo $item['height'];?>" />px
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">关联数据ID</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='data_id' name="data_id" class="form-control" value="<?php  echo $item['data_id'];?>" />
                        <div class='form-control-static'><span class="res-alert"></span>
                        <span class="help-block">填写关联到的数据ID，点击图位默认链接到相关数据</span></div>
 
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">图位链接</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
                    		<div class="input-group form-group" style="margin: 0;">
                    			<input type="text" value="<?php  echo $item['link'];?>" class="form-control valid" name="link" placeholder="" id="sectionlink">
                    				<span data-input="#sectionlink" data-toggle="selectUrl" class="input-group-addon btn btn-default">选择链接</span>
                    		</div>
                        <?php  } else { ?>
                            
                        	<div class='form-control-static'><?php  echo $item['link'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <?php if( ce('shop.section' ,$item) ) { ?>
                    <div class="col-sm-9 col-xs-12">
                        <textarea name='desc' class="form-control"><?php  echo $item['desc'];?></textarea>
                    </div>
                    <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['desc'];?></div>
                    <?php  } ?>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
                    		<label class='radio-inline'>
                            	<input type='radio' name='enabled' value=1' <?php  if($item['enabled']==1) { ?>checked<?php  } ?> /> 显示
                            </label>
                        	<label class='radio-inline'>
                        		<input type='radio' name='enabled' value=0' <?php  if($item['enabled']==0) { ?>checked<?php  } ?> /> 隐藏
                        	</label>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  if(empty($item['enabled'])) { ?>隐藏<?php  } else { ?>显示<?php  } ?></div>
                        <?php  } ?>
                    </div>
                </div>
            		
            <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
                    		<input type="submit" value="提交" class="btn btn-primary"  />
                    	<?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.section.add|shop.section.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#name").isEmpty()) {
            Tip.focus("name", "请填写图位名称!");
            return false;
        }
        return true;
    }
</script>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>