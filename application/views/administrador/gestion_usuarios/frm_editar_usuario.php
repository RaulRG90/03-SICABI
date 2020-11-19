<form id="frm_editar_acreditador" class="was-validated modal">

    <div class="modal-dialog">
        <div class="modal-content">
            
            <!-- Modal Cabecera -->
            <div class="modal-header">
              <h3 class="modal-title">Editar Usuario</h3>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal Cuerpo -->
            <div class="modal-body">
                
                <!--id-->
                <input id="usu_id" type="hidden" />
                
                <!--Nombre-->
                <div id="edit_nombre" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Nombre</span>
                    </div>
                    <input type="text" class="form-control" required="required"/>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">El nombre no puede ir vacio.</div>
                </div>

                <!--Usuario-->
                <div id="edit_usuario" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Usuario</span>
                    </div>
                    <input type="text" class="form-control" required="required"/>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">El usuario no puede ir vacio.</div>
                </div>

                <div id="perfil" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Perfil</span>
                    </div>
                    <select class="form-control" id="edit_perfil" required="required">
                        <option value="1">Administrador</option>
                        <option value="2">Acreditador de Editoriales</option>
                        <option value="3">Editorial</option>
                        <option value="4">Recepcion de Materiales</option>
                        <option value="5">Representante de lectores</option>
                        <option value="7">Lector</option>
                        <option value="8">Recepcion de Materiales de Preeselección</option>
                        <option value="9">Selección</option>
                        <option value="10">Validación Técnica</option>
                    </select>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">El usuario no puede ir vacio.</div>
                </div>
                
                <div id="modulo" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Módulo</span>
                    </div>
                    <select class="form-control" id="edit_modulo" required="required">
                        <option value="1">Convocatoria</option>
                        <option value="2">Acreditación de Editoriales</option>
                        <option value="3">Registro de Títulos</option>
                        <option value="4">Entrega de Materiales</option>
                        <option value="5">Preeselección</option>
                        <option value="6">Entrega de materiales Preeselección</option>
                        <option value="7">Selección</option>
                        <option value="8">Evaluación Técnica</option>
                    </select>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">El usuario no puede ir vacio.</div>
                </div>
                
                <!--Contraseña-->
                <div id="edit_contrasenia" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Contraseña</span>
                    </div>
                    <input type="password" class="form-control" required="required"/>
                    <div class="input-group-prepend ver_contrasenia">
                        <i class="input-group-text fa fa-eye"></i>
                    </div>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">La contraseña no puede ir vacia.</div>
                </div>

                <!--Confirmar Contraseña-->
                <div id="edit_confirm_contrasenia" class="input-group mb-3">
                    <div class="input-group-append">
                        <span class="input-group-text">Confirmar Contraseña</span>
                    </div>
                    <input type="password" class="form-control" required="required"/>
                    <div class="input-group-prepend ver_contrasenia">
                        <i class="input-group-text fa fa-eye"></i>
                    </div>
                    <div class="valid-feedback">Ok.</div>
                    <div class="invalid-feedback">Confirma la contraseña.</div>
                </div>
            </div>
            
            <!-- Modal Pie -->
            <div class="modal-footer">
                <!--Guardar-->
                <button id="btn_editar_acreditador" type="submit" class="btn btn-success">Guardar</button>
            </div>
        </div>
    </div>
</form>


