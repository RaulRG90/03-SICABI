<!-- Form Acreditar Editorial -->
<div id="mdl_editar_editorial" class="modal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header text-center">
                <h3 class="modal-title">Acreditación de Editoriales - Editar registro</h3>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="frm_editar_editorial" class="was-validated">

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Razón Social/Titular:</span>
                        </div>
                        <input id="edit_txt_razon_social" type="text" class="form-control" placeholder="Razón social de la editorial" required="required" pattern="[a-zA-Z,áéíóúÁÉÍÓÚÑñ&.' ]+" >
                        <div class="valid-feedback">OK.</div>
                        <div class="invalid-feedback">La razón social no puede ir vacia y solo acepta letras y signos de puntuación.</div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Grupo Editorial:</span>
                        </div>
                        <input id="edit_txt_grupo_editorial" type="text" class="form-control" placeholder="Grupo editorial" pattern="[a-zA-Z,áéíóúÁÉÍÓÚÑñ&.' ]+">
                        <div class="valid-feedback">OK.</div>
                        <div class="invalid-feedback">El grupo editorial no puede ir vacio y solo acepta letras y signos de puntuación.</div>
                    </div>


                    <fieldset>
                        <legend>Sellos editoriales</legend>
                        <div id="edit_sello_editorial_1" class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Sello Editorial:</span>
                            </div>
                            <input type="text" class="form-control sello_editorial" placeholder="Nuevo sello editorial" id="edit_txt_sello_editorial_1" />
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary btn_agregar_sello_editar">
                                    <i class="far fa-plus-square"></i>
                                </button>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>Datos del Director General</legend>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre Completo:</span>
                            </div>
                            <input id="edit_txt_nombre_director_general" type="text" class="form-control" placeholder="Nombre del director general"  required="required" pattern="[a-zA-Z,áéíóúÁÉÍÓÚÑñ' ]+">
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">El nombre del director general no puede ir vacio y solo acepta letras y signos de puntuación.</div>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Correo Electronico:</span>
                            </div>
                            <input id="edit_txt_email_director_general" type="email" class="form-control" placeholder="Correo electronico de contacto" required="required">
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">El correo electrónico no puede ir vacio.</div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Teléfonos:</span>
                            </div>
                            <input id="edit_txt_celular_director_general" type="tel" class="form-control" placeholder="Celular" required="required" />
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">Proporcione al menos un número de contacto.</div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>Datos del Representante</legend>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre Completo:</span>
                            </div>
                            <input id="edit_txt_nombre_representante_editorial" type="text" class="form-control" placeholder="Nombre del representante editorial" required="required" pattern="[a-zA-Z,áéíóúÁÉÍÓÚÑñ' ]+">
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">
                                El nombre del representante editorial no puede ir vacio y solo acepta letras y signos de puntuación.
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Cargo:</span>
                            </div>
                            <input id="edit_txt_cargo_representante_editorial" type="text" class="form-control" placeholder="Cargo del representante editorial"  required="required" pattern="[a-zA-Z,áéíóúÁÉÍÓÚÑñ' ]+">
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">
                                El cargo del representante editorial no puede ir vacio y solo acepta letras y signos de puntuación.
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Correo Electrónico:</span>
                            </div>
                            <input id="edit_txt_email_representante_editorial" type="email" class="form-control" placeholder="Correo electrónico de contacto" required="required">
                            <div class="valid-feedback">OK.</div>
                            <div class="invalid-feedback">El correo electrónico no puede ir vacio.</div>
                        </div>
                    </fieldset>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Observaciones:</span>
                        </div>
                        <textarea id="edit_txt_observaciones" class="form-control"></textarea>
                    </div>

                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button id="btn_edit_enviar" form="frm_editar_editorial" type="submit" class="btn btn-success">Enviar</button>
                <button id="btn_edit_cancelar" form="frm_editar_editorial" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
            </div>

        </div>
    </div>
</div>



