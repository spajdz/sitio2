<div class="row">
	<div class="col-md-12">
		<div class="page-title">
			<h2><span class="fa fa-list"></span> Usuarios</h2>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Editar Usuario</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<?= $this->Form->create('Usuario', array('class' => 'form-horizontal', 'type' => 'file', 'inputDefaults' => array('label' => false, 'div' => false, 'class' => 'form-control'))); ?>
						<?= $this->Form->input('id'); ?>
						<table class="table">
							<tr>
								<th><?= $this->Form->label('tipo_usuario_id', 'Tipo usuario'); ?></th>
								<td><?= $this->Form->input('tipo_usuario_id', array('class' => 'form-control select')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('rut', 'Rut'); ?></th>
								<td><?= $this->Form->input('rut', array('placeholder' => 'Rut')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('dv', 'Dv'); ?></th>
								<td><?= $this->Form->input('dv', array('placeholder' => 'Dv')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('nombre', 'Nombre'); ?></th>
								<td><?= $this->Form->input('nombre', array('placeholder' => 'Nombre')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('apellido_paterno', 'Apellido paterno'); ?></th>
								<td><?= $this->Form->input('apellido_paterno', array('placeholder' => 'Apellido paterno')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('apellido_materno', 'Apellido materno'); ?></th>
								<td><?= $this->Form->input('apellido_materno', array('placeholder' => 'Apellido materno')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('genero', 'Genero'); ?></th>
								<td><?= $this->Form->input('genero', array('placeholder' => 'Genero')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('email', 'Email'); ?></th>
								<td><?= $this->Form->input('email', array('placeholder' => 'Email')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('clave', 'Clave'); ?></th>
								<td><?= $this->Form->input('clave', array('type' => 'password', 'autocomplete' => 'off', 'value' => '', 'placeholder' => 'Clave')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('repetir_clave', 'Repetir clave'); ?></th>
								<td><?= $this->Form->input('repetir_clave', array('type' => 'password', 'autocomplete' => 'off', 'value' => '', 'placeholder' => 'Repetir clave')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('telefono', 'Telefono'); ?></th>
								<td><?= $this->Form->input('telefono', array('placeholder' => 'Telefono')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('fecha_nacimiento', 'Fecha nacimiento'); ?></th>
								<td><?= $this->Form->input('fecha_nacimiento', array('placeholder' => 'Fecha nacimiento')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('codigo', 'Codigo'); ?></th>
								<td><?= $this->Form->input('codigo', array('placeholder' => 'Codigo')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('codigo_expiracion', 'Codigo expiracion'); ?></th>
								<td><?= $this->Form->input('codigo_expiracion', array('placeholder' => 'Codigo expiracion')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('direccion_count', 'Direccion count'); ?></th>
								<td><?= $this->Form->input('direccion_count', array('placeholder' => 'Direccion count')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('activo', 'Activo'); ?></th>
								<td><?= $this->Form->input('activo', array('class' => 'icheckbox')); ?></td>
							</tr>
							<tr>
								<th><?= $this->Form->label('eliminado', 'Eliminado'); ?></th>
								<td><?= $this->Form->input('eliminado', array('class' => 'icheckbox')); ?></td>
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
