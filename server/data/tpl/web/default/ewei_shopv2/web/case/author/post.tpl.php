<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('case.author.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('case/author/add')?>">添加新作者</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('case/author')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>作者 <small><?php  if(!empty($item['id'])) { ?>修改【<?php  echo $item['name'];?>】<?php  } ?></small></h2> 
</div>
 
 
    <form <?php if( ce('case.author' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['id'];?>" />
 
                <div class="form-group">
                    <label class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('case.author' ,$item) ) { ?>
                                <input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                                <span class='help-block'>数字越大，排名越靠前</span>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">姓名</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('case.author' ,$item) ) { ?>
                        <input type="text" id='name' name="name" class="form-control" value="<?php  echo $item['name'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['advname'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">联系电话</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('case.author' ,$item) ) { ?>
                        <input type="text" id='mobile' name="mobile" class="form-control" value="<?php  echo $item['mobile'];?>" />
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['advname'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">关联会员</label>
                    <div class="col-sm-9 col-xs-12 ">
                    <?php if( ce('case.author' ,$item) ) { ?>
                       <div class='input-group'>
                         <input type="hidden" value="<?php  echo $item['mid'];?>" id='mid' name='mid' class="form-control"  />
            <input type="text" name="member" value="<?php  if(!empty($member)) { ?><?php  echo $member['nickname'];?>/<?php  echo $member['realname'];?>/<?php  echo $member['mobile'];?><?php  } ?>" id="member" class="form-control" readonly />
                        <div class='input-group-btn'>
                            <button class="btn btn-default" type="button" onclick="popwin = $('#modal-module-menus-notice').modal();">选择会员</button>
                            <button class="btn btn-danger" type="button" onclick="$('#mid').val('');$('#member').val('');$('#memberavatar').hide()">清除选择</button>
                        </div>
                    </div>
                    <span id="memberavatar" class='help-block' <?php  if(empty($member)) { ?>style="display:none"<?php  } ?>><img  style="width:100px;height:100px;border:1px solid #ccc;padding:1px" src="<?php  echo tomedia($member['avatar'])?>"/></span>
            
                    <div id="modal-module-menus-notice"  class="modal fade" tabindex="-1">
                        <div class="modal-dialog" style='width: 920px;'>
                            <div class="modal-content">
                                <div class="modal-header"><button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button><h3>选择关联会员</h3></div>
                                <div class="modal-body" >
                                    <div class="row">
                                        <div class="input-group">
                                            <input type="text" class="form-control" name="keyword" value="" id="search-kwd-notice" placeholder="请输入昵称/姓名/手机号" />
                                            <span class='input-group-btn'><button type="button" class="btn btn-default" onclick="search_members();">搜索</button></span>
                                        </div>
                                    </div>
                                    <div id="module-menus-notice" style="padding-top:5px;"></div>
                                </div>
                                <div class="modal-footer"><a href="#" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</a></div>
                            </div>
            
                        </div>
                    </div>
                   
                    <?php  } else { ?>
                    <div class='form-control-static'>
                        <input type="hidden" value="<?php  echo $member['agentid'];?>" id='agentid' name='adata[agentid]' class="form-control"  />
                        <?php  if(!empty($member)) { ?><img  style="width:100px;height:100px;border:1px solid #ccc;padding:1px" src="<?php  echo tomedia($member['avatar'])?>"/><?php  } else { ?>无<?php  } ?>
                    </div>
                    <?php  } ?>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('case.author' ,$item) ) { ?>
                        <?php  echo tpl_form_field_image('thumb', $item['thumb'])?>
                        <span class='help-block'>建议尺寸:640 * 640 , 请将所有作者图片尺寸保持一致</span>
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
                    <label class="col-sm-2 control-label must">分类</label>
                    <div class="col-sm-9 col-xs-12">
                        <select class="form-control" name="cate" id="cate">
                            <option value="">请选择</option>
                            <?php  if(is_array($cates)) { foreach($cates as $v) { ?>
                            <option value="<?php  echo $v['id'];?>" <?php  if($item['cate']==$v['id']) { ?> selected<?php  } ?>><?php  echo $v['name'];?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">简介</label>
                    <?php if( ce('case.author' ,$item) ) { ?>
                    <div class="col-sm-9 col-xs-12">
                        <textarea name='desc' class="form-control"><?php  echo $item['desc'];?></textarea>
                    </div>
                    <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['desc'];?></div>
                    <?php  } ?>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">详细介绍</label>
                    <div class="col-sm-9 col-xs-12">    
                        <?php if( ce('case.author' ,$item) ) { ?>
                            <?php  echo tpl_ueditor('content',$item['content'])?>
                        <?php  } else { ?>
                            <textarea id='detail' style='display:none'><?php  echo $item['content'];?></textarea>
                            <a href='javascript:preview_html("#content")' class="btn btn-default">查看内容</a>
                        <?php  } ?>
            
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                            <?php if( ce('case.author' ,$item) ) { ?>
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
                           <?php if( ce('case.author' ,$item) ) { ?>
                            <input type="submit" value="提交" class="btn btn-primary"  />
                        <?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('case.author')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#advname").isEmpty()) {
            Tip.focus("advname", "请填写作者名称!");
            return false;
        }
        return true;
    }
	
	
    function search_members() {
        if ($.trim($('#search-kwd-notice').val()) == '') {
            Tip.focus('#search-kwd-notice', '请输入关键词');
            return;
        }
        $("#module-menus-notice").html("正在搜索....")
        $.get('<?php  echo webUrl('member/list/query')?>', {
            keyword: $.trim($('#search-kwd-notice').val()), 'op': 'query', selfid: "<?php  echo $id;?>"
        }, function (dat) {
            $('#module-menus-notice').html(dat);
        });
    }
    function select_member(o) {
        $("#mid").val(o.id);
        $("#memberavatar").show();
        $("#memberavatar").find('img').attr('src', o.avatar);
        $("#member").val(o.nickname + "/" + o.realname + "/" + o.mobile);
        $("#modal-module-menus-notice .close").click();
    }
</script>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>