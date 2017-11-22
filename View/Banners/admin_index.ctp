<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Banners</h2>
		</div>

		<div class="page-content-wrap">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Listado de Banners</h3>
					<div class="btn-group pull-right">
						<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo Banner', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
						<?= $this->Html->link('<i class="fa fa-file-excel-o"></i> Exportar a Excel', array('action' => 'exportar'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
					</div>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="sort">
									<? $this->Paginator->options(array('title' => 'Haz click para ordenar por este criterio')); ?>
									<th><?= $this->Paginator->sort('administrador_id'); ?></th>
									<th><?= $this->Paginator->sort('nombre'); ?></th>
									<th><?= $this->Paginator->sort('descripcion'); ?></th>
									<th><?= $this->Paginator->sort('imagen'); ?></th>
									<th><?= $this->Paginator->sort('imagen_mobile'); ?></th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $banners as $banner ) : ?>
								<tr>
									<td><?= $this->Html->link($banner['Administrador']['nombre'], array('controller' => 'administradores', 'action' => 'edit', $banner['Administrador']['id'])); ?></td>
									<td><?= h($banner['Banner']['nombre']); ?>&nbsp;</td>
									<td><?= h($banner['Banner']['descripcion']); ?>&nbsp;</td>
									<td><?= h($banner['Banner']['imagen']); ?>&nbsp;</td>
									<td><?= h($banner['Banner']['imagen_mobile']); ?>&nbsp;</td>
									<td>
										<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $banner['Banner']['id']), array('class' => 'btn btn-xs btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
										<?= $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $banner['Banner']['id']), array('class' => 'btn btn-xs btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
										<? if ( $banner['Banner']['activo'] ) : ?>
										<?= $this->Html->link('<i class="fa fa-ban"></i> Desactivar', array('action' => 'desactivar', $banner['Banner']['id']), array('class' => 'btn btn-xs btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
										<? else : ?>
										<?= $this->Html->link('<i class="fa fa-check"></i> Activar', array('action' => 'activar', $banner['Banner']['id']), array('class' => 'btn btn-xs btn-success', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
										<? endif; ?>
									</td>
								</tr>
								<? endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="pull-right">
			<ul class="pagination">
				<?= $this->Paginator->prev('« Anterior', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'first disabled hidden')); ?>
				<?= $this->Paginator->numbers(array('tag' => 'li', 'currentTag' => 'a', 'modulus' => 2, 'currentClass' => 'active', 'separator' => '')); ?>
				<?= $this->Paginator->next('Siguiente »', array('tag' => 'li'), null, array('tag' => 'li', 'disabledTag' => 'a', 'class' => 'last disabled hidden')); ?>
			</ul>
		</div>
	</div>
</div>
