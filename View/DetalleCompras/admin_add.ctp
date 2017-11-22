<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Detalle Compras</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Nuevo Detalle Compra</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('DetalleCompra', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('compra_id', 'Compra'); ?></th>
								<td><?= $this->Form->input('compra_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('producto_id', 'Producto'); ?></th>
								<td><?= $this->Form->input('producto_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('cantidad', 'Cantidad'); ?></th>
								<td><?= $this->Form->input('cantidad', array('placeholder' => 'Cantidad')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('precio_unitario', 'Precio unitario'); ?></th>
								<td><?= $this->Form->input('precio_unitario', array('placeholder' => 'Precio unitario')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('total', 'Total'); ?></th>
								<td><?= $this->Form->input('total', array('placeholder' => 'Total')); ?></td>
							</tr>
						</table>
		
						<div class="pull-right">
							<input type="submit" class="btn btn-primary esperar-carga" autocomplete="off" data-loading-text="Espera un momento..." value="Guardar cambios">
							<?= $this->Html->link('Cancelar', array('action' => 'index'), array('class' => 'btn btn-danger')); ?>
						</div>
					<?= $this->Form->end(); ?>
				</div>
			</div>
		</div>
	</div>
</div>
