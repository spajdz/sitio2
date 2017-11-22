<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Detalle Cargas</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Detalle Carga</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('DetalleCarga', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<?= $this->Form->input('id'); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('carga_id', 'Carga'); ?></th>
								<td><?= $this->Form->input('carga_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('error', 'Error'); ?></th>
								<td><?= $this->Form->input('error', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('mensaje', 'Mensaje'); ?></th>
								<td><?= $this->Form->input('mensaje', array('placeholder' => 'Mensaje')); ?></td>
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
