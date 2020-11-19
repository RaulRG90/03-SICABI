<div class="modal fade" id="crear_usuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="crear_usuario_label">Agregar Usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="frm_crear_usuario" class="was-validated">
                    
                    <!--Nombre-->
                    <div id="nombre" class="input-group mb-3">
                        <div class="input-group-append">
                            <span class="input-group-text">Nombre</span>
                        </div>
                        <input type="text" class="form-control" required="required"/>
                        <div class="valid-feedback">Ok.</div>
                        <div class="invalid-feedback">El nombre no puede ir vacio.</div>
                    </div>

                    <!--Usuario-->
                    <div id="usuario" class="input-group mb-3">
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
                        <select class="form-control" id="select_perfil" required="required">
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
                        <select class="form-control" id="select_modulo" required="required">
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
                    <div id="contrasenia" class="input-group mb-3">
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
                    <div id="confirm_contrasenia" class="input-group mb-3">
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

                    <!--Guardar-->
                    <button id="btn_guardar_usuario" type="submit" class="btn btn-success">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>


