<div class="sectiontocopy">
    <div class="row payment_details">
        <input type="hidden" name="payment_id[]" value="0" class="form-control">

        <div class="col-sm-3">
            <label class="form-label" for="date">Date:</label>
            <input type="date" name="date[]" value="<?= date('Y-m-d') ?>" class="form-control " />

        </div>
        <div class="col-md-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="text" name="amount[]" class="form-control calcamount" placeholder="Enter amount" />

        </div>
        <div class="col-md-3">
            <label for="remark" class="form-label">Remark</label>
            <textarea name="remark[]" class="form-control " placeholder="Enter remark"></textarea>

        </div>
        <div class=" col-md-1">
            <div class="d-flex justify-content-end">
                <label class="form-label" for="prd"> &nbsp </label>
                <button type="button" class="btn btn-danger del mt-5">X</button>
            </div>
        </div>
    </div>
</div>
<form class="row" action="<?= site_url('admin/Booking/givepayment') ?>" method="post">
    <input type="hidden" name="booking_id" value="<?= $id ?>">

    <div class="parent my-4" id="paste">
        <?php if (!empty($data)) {
            $j = 1;
            foreach ($data as $rowdata) { ?>

                <div class="row payment_details">
                    <input type="hidden" name="payment_id[]" value="<?php echo $rowdata->id; ?>" class="form-control">
                    <div class="col-sm-3">
                        <label class="form-label" for="date">Date:</label>
                        <input type="date" name="date[]" value="<?= date('Y-m-d', strtotime($rowdata->date)) ?>" class="form-control " />
                    </div>
                    <div class="col-md-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="text" name="amount[]" class="form-control calcamount" value="<?= $rowdata->amount; ?>" placeholder="Enter amount" />
                    </div>
                    <div class="col-md-3">
                        <label for="remark" class="form-label">Remark</label>
                        <textarea name="remark[]" class="form-control " placeholder="Enter remark"><?= $rowdata->remark; ?></textarea>
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
            <div class="row payment_details">
                <input type="hidden" name="payment_id[]" value="0" class="form-control">
                <div class="col-sm-3">
                    <label class="form-label" for="date">Date:</label>
                    <input type="date" name="date[]" value="<?= date('Y-m-d') ?>" class="form-control " />
                </div>
                <div class="col-md-3">
                    <label for="remark" class="form-label">Amount</label>
                    <input type="text" name="amount[]" class="form-control calcamount" placeholder="Enter amount" />
                </div>

                <div class="col-md-3">
                    <label for="remark" class="form-label">Remark</label>
                    <textarea name="remark[]" class="form-control " placeholder="Enter remark"></textarea>
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
    <div class="row mt-4">
        <div class="col-sm-4">
            <label for="total_cha_amount"><b>Total CHA Amount :</b></label>
            <input type="text" readonly class=" form-control total_cha_amount" value="<?= $booking_data['cha_bill'] ?>" name="total_cha_amount" placeholder="Total Cha Amount" readonly />
        </div>
        <div class="col-sm-4">
            <label for="total_paid_amount"><b>Total Paid Amount :</b></label>
            <input type="text" class=" form-control total_paid_amount" name="total_paid_amount" placeholder="Total Paid Amount" readonly />
        </div>

        <div class="col-sm-4">
            <label for="total_remaining_amount"><b>Total Remaining Amount :</b></label>
            <input type="text" class=" form-control total_remaining_amount" name="total_remaining_amount" placeholder="Total Remaining Amount" readonly />
        </div>
    </div>

    <hr class="mt-1">
    <div class="row">
        <div class="d-flex justify-content-end">

            <div class="col-sm-3">
                <input class="btn btn-primary" id="submit" type="submit" value="PAYMENT">

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
                var payment_details = $(".payment_details").length;
                if (payment_details > 1) {
                    $(this).parent().parent().parent().remove();
                    maintotal();
                }
            });
            $(document).on('keyup', '.calcamount', function() {
                maintotal();
            });
            maintotal();

            function maintotal() {
                var subtotal = 0;

                var totalpricelength = $(".calcamount").length;

                for (var i = 0; i < totalpricelength; i++) {
                    subtotal += parseFloat($($(".calcamount")[i]).val()) || 0;
                }
                $('.total_paid_amount').val(subtotal);

                var chaamount = parseFloat($(".total_cha_amount").val()) || 0;
                var remaining = chaamount - subtotal;
                if (remaining < 0) {
                    alert("payment not matched");
                }
                $('.total_remaining_amount').val(remaining);

            }
        });
    </script>
</div>