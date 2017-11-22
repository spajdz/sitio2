<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Detalle Compras</h2>
		</div>

		<div class="page-content-wrap">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Listado de Detalle Compras</h3>
					<div class="btn-group pull-right">
						<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo Detalle Compra', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
						<?= $this->Html->link('<i class="fa fa-file-excel-o"></i> Exportar a Excel', array('action' => 'exportar'), array('class' => 'btn btn-primary', 'escape' => false)); ?>
					</div>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="sort">
									<? $this->Paginator->options(array('title' => 'Haz click para ordenar por este criterio')); ?>
									<th><?= $this->Paginator->sort('compra_id'); ?></th>
									<th><?= $this->Paginator->sort('producto_id'); ?></th>
									<th><?= $this->Paginator->sort('cantidad'); ?></th>
									<th><?= $this->Paginator->sort('precio_unitario'); ?></th>
									<th><?= $this->Paginator->sort('total'); ?></th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $detalleCompras as $detalleCompra ) : ?>
								<tr>
									<td><?= $this->Html->link($detalleCompra['Compra']['id'], array('controller' => 'compras', 'action' => 'edit', $detalleCompra['Compra']['id'])); ?></td>
									<td><?= $this->Html->link($detalleCompra['Producto']['nombre'], array('controller' => 'productos', 'action' => 'edit', $detalleCompra['Producto']['id'])); ?></td>
									<td><?= h($detalleCompra['DetalleCompra']['cantidad']); ?>&nbsp;</td>
									<td><?= h($detalleCompra['DetalleCompra']['precio_unitario']); ?>&nbsp;</td>
									<td><?= h($detalleCompra['DetalleCompra']['total']); ?>&nbsp;</td>
									<td>
										<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $detalleCompra['DetalleCompra']['id']), array('class' => 'btn btn-xs btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
										<?= $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $detalleCompra['DetalleCompra']['id']), array('class' => 'btn btn-xs btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
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
