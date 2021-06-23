<div class="row">
<div class="col-sm-12">
<h4 class="page-title">Резервыне копии</h4>
<ol class="breadcrumb">
<li><a href="/control">Главная</a></li>
<li class="active">Резервыне копии</li>
</ol>
</div>
</div>


<div class="col-sm-12">
<div class="card-box">
<h4 class="m-t-0 header-title"><b>Резервыне копии</b></h4>

<a href="/control/backup/download?type=base" class="btn btn-inverse btn-custom btn-rounded waves-effect waves-light btn-xs">Создать копию базы данных</a>
<a href="/control/backup/download?type=files" class="btn btn-inverse btn-custom btn-rounded waves-effect waves-light btn-xs">Создать копию файлов</a>



<table class="table table table-hover m-0">
<thead>
<tr>
<th>#</th>
<th>Название</th>
<th>Тип</th>
<th></th>
</tr>
</thead>

<tbody>
<?php foreach($backups as $row):?>
<tr id="backup<?=$row['id'];?>">
<td><?=$row['id'];?></td>
<td><?=$row['name'];?></td>
<td><? if($row['type'] == 'database'):?>База данных<? else if($row['type'] == 'files'):?>Файлы<?php end;?></td>
<td style="text-align: right;">
<a href="#" onclick="remove(<?=$row['id'];?>); return false;" class="text-muted" title="Удалить"><i class="fa fa-trash"></i></a>
<a href="/<?php echo $row['hash'];?>" class="text-muted" title="Скачать" target="_blank"><i class="fa fa-save"></i></a>

</td>
</tr> 
<?php endforeach;?>				
</tbody>
</table>


</div>
</div>

<script>
function remove(id){
    if(confirm("Вы действительно хотите удалить?")){
     $.ajax({
        url: "/control/backup/remove",
        data: {'id':id},
        success: function(){
        $('#backup'+id+'').hide(300);
        }
     });  
    }
}
</script>
