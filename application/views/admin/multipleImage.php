<div class="sectiontocopy">
    <div class="row document_image">
        <input type="hidden" name="uploaded_id[]" value="0" class="form-control">
        <div class="col-sm-5">
            <label class="form-label" for="prd">Document Name :</label>
            <select class="form-select select2 " name="document_id[]">
                <option>Select document</option>
                <?php
                $document = $this->db->get('document')->result();
                foreach ($document as $value) {
                ?>
                    <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['document_id']) {
                                                            echo 'selected';
                                                        } ?>><?= $value->name; ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="col-md-6">
            <label for="formFile" class="form-label">Uploade documents</label>
            <input type="file" name="uploade_documents[]" class="form-control " multiple />

        </div>
        <div class=" col-md-1">
            <div class="d-flex justify-content-end">
                <label class="form-label" for="prd"> &nbsp </label>
                <button type="button" class="btn btn-danger del mt-5">X</button>
            </div>
        </div>
    </div>
</div>
<form class="row" action="<?= site_url('admin/Booking/uploaddocument') ?>" method="post" enctype="multipart/form-data">
    <input type="hidden" name="booking_id" value="<?= $id ?>">

    <div class="parent my-4" id="paste">
        <?php if (!empty($data)) {
            $j = 1;
            foreach ($data as $rowdata) { ?>

                <div class="row document_image">
                    <input type="hidden" name="uploaded_id[]" value="<?php echo $rowdata->id; ?>" class="form-control">
                    <div class="col-sm-3">
                        <label class="form-label" for="prd">Document Name :</label>
                        <select class="form-select select2 " name="document_id[]">
                            <option>Select document</option>
                            <?php
                            $document = $this->db->get('document')->result();
                            foreach ($document as $value) {
                            ?>
                                <option value="<?= $value->id; ?>" <?php if (isset($rowdata) && $rowdata->document_id == $value->id) {
                                                                        echo 'selected';
                                                                    } ?>><?= $value->name; ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <label for="formFile" class="form-label">Uploade documents</label>
                        <input type="file" name="uploade_documents[]" class="form-control " />

                    </div>
                    <div class="col-md-2 mt-5">
                        <?php
                        if (!empty($rowdata->name)) {
                            echo "<a href='" . base_url('upload/documents/' . $rowdata->name) . "' target='_blank' class='btn btn-sucess'>View</a>";
                        }
                        ?>
                    </div>
                    <div class=" col-md-1">
                        <div class="d-flex justify-content-end">
                            <label class="form-label" for="prd"> &nbsp </label>
                            <button type="button" class="btn btn-danger del mt-5">X</button>
                        </div>
                    </div>
                </div>
            <?php }
        } else {
            ?>
            <div class="row document_image">
                <input type="hidden" name="uploaded_id[]" value="0" class="form-control">
                <div class="col-sm-5">
                    <label class="form-label" for="prd">Document Name :</label>
                    <select class="form-select select2 " name="document_id[]">
                        <option>Select document</option>
                        <?php
                        $document = $this->db->get('document')->result();
                        foreach ($document as $value) {
                        ?>
                            <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['document_id']) {
                                                                    echo 'selected';
                                                                } ?>><?= $value->name; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="formFile" class="form-label">Uploade documents</label>
                    <input type="file" name="uploade_documents[]" class="form-control " />

                </div>

                <div class=" col-md-1">
                    <div class="d-flex justify-content-end">
                        <label class="form-label" for="prd"> &nbsp </label>
                        <button type="button" class="btn btn-danger del mt-5">X</button>
                    </div>
                </div>
            </div>
        <?php
        } ?>

    </div>
    <div class="row">
        <div class="col-sm-12 ">
            <label class="form-label" for="prd"> &nbsp </label>
            <button type="button" class="btn btn-primary" id="add">+</button>
        </div>
    </div>
    <hr class="mt-1">
    <div class="row">
        <div class="d-flex justify-content-end">

            <div class="col-sm-3">
                <input class="btn btn-primary" id="submit" type="submit" value="ADD DOCUMENT">

            </div>
        </div>

    </div>

</form>


<div id="extra_javascript">
    <script>
        var main_row = "";
        $(document).ready(function() {
            main_row = $(".sectiontocopy").html();
            $(".sectiontocopy").remove();

            $("#add").click(function() {
                $("#paste").append(main_row);
            });

            $(document).on('click', '.del', function() {
                var document_image = $(".document_image").length;
                if (document_image > 1) {
                    $(this).parent().parent().parent().remove();
                }
            });
        });
    </script>
</div>