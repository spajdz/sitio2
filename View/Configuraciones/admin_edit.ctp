<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Configuraciones</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Configuracion</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Configuracion', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<?= $this->Form->input('id'); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('administrador_id', 'Administrador'); ?></th>
								<td><?= $this->Form->input('administrador_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('identificador', 'Identificador'); ?></th>
								<td><?= $this->Form->input('identificador', array('placeholder' => 'Identificador')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('valor', 'Valor'); ?></th>
								<td><?= $this->Form->input('valor', array('placeholder' => 'Valor')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('descripcion', 'Descripcion'); ?></th>
								<td><?= $this->Form->input('descripcion', array('placeholder' => 'Descripcion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('activo', 'Activo'); ?></th>
								<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('eliminado', 'Eliminado'); ?></th>
								<td><?= $this->Form->input('eliminado', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('oculto', 'Oculto'); ?></th>
								<td><?= $this->Form->input('oculto', array('class' => 'icheckbox')); ?></td>
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
