<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Direcciones</h2>
		</div>

		<div class="page-content-wrap">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Listado de Direcciones</h3>
					<div class="btn-group pull-right">
						<?= $this->Html->link('<i class="fa fa-plus"></i> Nuevo Direccion', array('action' => 'add'), array('class' => 'btn btn-success', 'escape' => false)); ?>
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
									<th><?= $this->Paginator->sort('tipo_direccion_id'); ?></th>
									<th><?= $this->Paginator->sort('comuna_id'); ?></th>
									<th><?= $this->Paginator->sort('nombre'); ?></th>
									<th><?= $this->Paginator->sort('calle'); ?></th>
									<th>Acciones</th>
								</tr>
							</thead>
							<tbody>
								<? foreach ( $direcciones as $direccion ) : ?>
								<tr>
									<td><?= $this->Html->link($direccion['Usuario']['nombre'], array('controller' => 'usuarios', 'action' => 'edit', $direccion['Usuario']['id'])); ?></td>
									<td><?= $this->Html->link($direccion['TipoDireccion']['nombre'], array('controller' => 'tipo_direcciones', 'action' => 'edit', $direccion['TipoDireccion']['id'])); ?></td>
									<td><?= $this->Html->link($direccion['Comuna']['nombre'], array('controller' => 'comunas', 'action' => 'edit', $direccion['Comuna']['id'])); ?></td>
									<td><?= h($direccion['Direccion']['nombre']); ?>&nbsp;</td>
									<td><?= h($direccion['Direccion']['calle']); ?>&nbsp;</td>
									<td>
										<?= $this->Html->link('<i class="fa fa-edit"></i> Editar', array('action' => 'edit', $direccion['Direccion']['id']), array('class' => 'btn btn-xs btn-info', 'rel' => 'tooltip', 'title' => 'Editar este registro', 'escape' => false)); ?>
										<?= $this->Form->postLink('<i class="fa fa-remove"></i> Eliminar', array('action' => 'delete', $direccion['Direccion']['id']), array('class' => 'btn btn-xs btn-danger confirmar-eliminacion', 'rel' => 'tooltip', 'title' => 'Eliminar este registro', 'escape' => false)); ?>
										<? if ( $direccion['Direccion']['activo'] ) : ?>
										<?= $this->Html->link('<i class="fa fa-ban"></i> Desactivar', array('action' => 'desactivar', $direccion['Direccion']['id']), array('class' => 'btn btn-xs btn-danger', 'rel' => 'tooltip', 'title' => 'Desactivar este registro', 'escape' => false)); ?>
										<? else : ?>
										<?= $this->Html->link('<i class="fa fa-check"></i> Activar', array('action' => 'activar', $direccion['Direccion']['id']), array('class' => 'btn btn-xs btn-success', 'rel' => 'tooltip', 'title' => 'Activar este registro', 'escape' => false)); ?>
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
