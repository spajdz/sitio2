<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Compras</h2>
		</div>

		<div class="page-content-wrap">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Listado de Compras</h3>
					<div class="btn-group pull-right">
						<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo Compra', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
						<?= $this->Html->link('<i class="fa fa-file-excel-o"></i> Exportar a Excel', array('action' => 'exportar'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
					</div>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="sort">
									<? $this->Paginator->options(array('title' => 'Haz click para ordenar por este criterio')); ?>
									<th><?= $this->Paginator->sort('usuario_id'); ?></th>
									<th><?= $this->Paginator->sort('estado_compra_id'); ?></th>
									<th><?= $this->Paginator->sort('retiro_sucursal'); ?></th>
									<th><?= $this->Paginator->sort('direccion_id'); ?></th>
									<th><?= $this->Paginator->sort('sucursal_id'); ?></th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $compras as $compra ) : ?>
								<tr>
									<td><?= $this->Html->link($compra['Usuario']['nombre'], array('controller' => 'usuarios', 'action' => 'edit', $compra['Usuario']['id'])); ?></td>
									<td><?= $this->Html->link($compra['EstadoCompra']['nombre'], array('controller' => 'estado_compras', 'action' => 'edit', $compra['EstadoCompra']['id'])); ?></td>
									<td><?= ($compra['Compra']['retiro_sucursal'] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-remove"></i>'); ?>&nbsp;</td>
									<td><?= $this->Html->link($compra['Direccion']['nombre'], array('controller' => 'direcciones', 'action' => 'edit', $compra['Direccion']['id'])); ?></td>
									<td><?= $this->Html->link($compra['Sucursal']['nombre'], array('controller' => 'sucursales', 'action' => 'edit', $compra['Sucursal']['id'])); ?></td>
									<td>
										<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $compra['Compra']['id']), array('class' => 'btn btn-xs btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
										<?= $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $compra['Compra']['id']), array('class' => 'btn btn-xs btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
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
