<?php defined('IN_IA') or exit('Access Denied');?><form class="form-horizontal form-validate" action="<?php  echo webUrl('order/op/setauthor')?>" method="post" enctype="multipart/form-data">
	<input type='hidden' name='id' value='<?php  echo $id;?>' />

	<div class="modal-dialog">
           <div class="modal-content" style="width:720px; height:300px;">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">画师</h4>
            </div>
            <div class="modal-body">
               <div class='input-group'>
                         <input type="hidden" value="<?php  echo $item['author'];?>" id='authorid' name='authorid' class="form-control"  />
            <input type="text" name="author" value="<?php  if($item['author'] > 0) { ?>(ID:<?php  echo $author['id'];?>)<?php  echo $author['name'];?>/<?php  echo $author['mobile'];?><?php  } ?>" id="author" class="form-control" readonly />
                        <div class='input-group-btn'>
                            <button class="btn btn-default" type="button" onclick="popwin = $('#select_author').modal();">选择画师</button>
                            <button class="btn btn-danger" type="button" onclick="$('#authorid').val('');$('#author').val('');">清除选择</button>
                        </div>
               </div>         
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" type="submit">提交</button>
                <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
            </div>
        </div>
        
        <div id="select_author"  class="modal fade" tabindex="-1">
            <div class="modal-dialog" style='width: 600px;'>
                <div class="modal-content">
                    <div class="modal-header"><button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button><h3>选择画师</h3></div>
                    <div class="modal-body" >
                        <div class="row">
                            <div class="input-group">
                                <input type="text" class="form-control" name="keyword" value="" id="search-kwd-notice" placeholder="请输入姓名/手机号" />
                                <span class='input-group-btn'><button type="button" class="btn btn-default" onclick="search_authors();">搜索</button></span>
                            </div>
                        </div>
                        <div id="module-menus-notice" style="padding-top:5px;"></div>
                    </div>
                    <div class="modal-footer"><a href="javascript:curclose();" class="btn btn-default" >关闭</a></div>
                </div>

            </div>
        </div>
</form>
<script>
function search_authors() {
	if ($.trim($('#search-kwd-notice').val()) == '') {
		Tip.focus('#search-kwd-notice', '请输入关键词');
		return;
	}
	$("#module-menus-notice").html("正在搜索....")
	$.get('<?php  echo webUrl('case/author/query')?>', {
		keyword: $.trim($('#search-kwd-notice').val()), 'op': 'query', selfid: "<?php  echo $id;?>"
	}, function (dat) {
		$('#module-menus-notice').html(dat);
	});
}
function select_author(o) {
	$("#authorid").val(o.id);
	$("#author").val('(ID: ' + o.id + ")" + o.name + "/" + o.mobile);
	$("#select_author").hide();
}

function curclose()
{
	$('#select_author').hide();
}
</script>