<div class="container-fuild my-4">
    <div class="row">

        <?php $this->load->view('admin/flash_message'); ?>
        <div class="col-sm-12 mt-2">
            <div class="card mx-4">
                <div class="card-header d-flex">
                    <h3 class="card-title">Booking Report </h3>
                </div>

                <div class="modal modal-blur fade" id="imageModel" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Uploade Documents</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body modal-body_1html">

                            </div>

                        </div>
                    </div>
                </div>

                <!-- payment model -->

                <div class="modal modal-blur fade" id="paymentModel" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Payment </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body modal-body_2html">

                            </div>

                        </div>
                    </div>
                </div>



                <div class="card-body border-bottom py-3">
                    <div class="row ">
                        <div class="col-sm-2">
                            <label>From date:</label> <br>
                            <input type="date" id="fromdate" name="fromdddate" class="form-control">
                        </div>
                        <div class="col-sm-2">
                            <label>To date:</label> <br>
                            <input type="date" id="todate" name="todate" class="form-control">
                        </div>

                        <div class="col-sm-2">
                            <label>Status</label> <br>
                            <select class="form-select select2" id="filterstatus">
                                <option value="">Select status</option>
                                <option value="Booking">Booking</option>
                                <option value="In-transit">In-transit</option>
                                <option value="Arrived">Arrived</option>
                            </select>
                        </div>
                        <div class="col-sm-6 mt-2">
                            <div class="d-flex justify-content-end">
                                <a class="" href="<?= base_url('admin/Booking') ?>"><button class="btn btn-primary"> <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-plus" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M12 5l0 14"></path>
                                            <path d="M5 12l14 0"></path>
                                        </svg>Booking</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br></br>
                    <div class="table-responsive">
                        <table id="booking" class="table card-table table-vcenter text-nowrap datatable">
                            <thead>
                                <tr>
                                    <th>Serial No </th>
                                    <th>Action</th>
                                    <th>Date</th>
                                    <th>Uploade document</th>
                                    <th>booking Payment</th>
                                    <th>Party</th>
                                    <th>Company </th>
                                    <th>Status </th>
                                    <th>Container type</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Net weight</th>
                                    <th>Gross weight</th>
                                    <th>Agent</th>
                                    <th>Cha </th>
                                    <th>Loading port </th>
                                    <th>Discharge Port</th>
                                    <th>Bill no</th>
                                    <th>Insurance</th>
                                    <th>Igm files</th>
                                    <th>ETA</th>
                                    <th>Custom duty</th>
                                    <th>Custom duty status</th>
                                    <th>Shipping line</th>
                                    <th>Shipping line status</th>
                                    <th>Delivery Date</th>
                                    <th>Cha bill</th>
                                    <th>Cha bill status</th>
                                    <th>Cha misc exp</th>
                                    <th>Cha misc exp status</th>
                                    <th>Transport</th>
                                    <th>Transport status</th>
                                    <th>User id</th>
                                    <th>Created_at</th>
                                    <th>updated_at</th>
                                </tr>
                            </thead>

                        </table>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- datatable ajax  -->

<script>
    $(document).ready(function() {

        var table = $('#booking').DataTable({
            "iDisplayLength": 5,
            "lengthMenu": [
                [5, 10, 25, 50, 100, 500, 1000, 5000],
                [5, 10, 25, 50, 100, 500, 1000, 5000]
            ],
            'processing': true,
            'serverSide': true,
            'destroy': true,
            'serverMethod': 'post',
            'searching': true,
            "ajax": {
                'url': "<?= base_url(); ?>admin/Booking/getlist",
                'data': function(data) {
                    data.filterstatus = $('#filterstatus').val();
                    data.todate = $('#todate').val();
                    data.fromdate = $('#fromdate').val();
                }
            },
            "columns": [{
                    data: 'id'
                },
                {
                    data: 'action'
                },
                {
                    data: 'date'
                },

                {
                    data: 'uploade_documents'
                },
                {
                    data: 'booking_payment'
                },
                {
                    data: 'party'
                },
                {
                    data: 'company'
                },
                {
                    data: 'status'
                },

                {
                    data: 'container'
                },
                {
                    data: 'category'
                },
                {
                    data: 'quantity'
                },
                {
                    data: 'net_wt'
                },
                {
                    data: 'gross_wt'
                },
                {
                    data: 'agent'
                },
                {
                    data: 'CHA'
                },
                {
                    data: 'loading_port'
                },
                {
                    data: 'discharge_port'
                },
                {
                    data: 'bill_no'
                },
                {
                    data: 'insurance'
                },
                {
                    data: 'igm_files'
                },
                {
                    data: 'ETA'
                },
                {
                    data: 'custom_duty'
                },
                {
                    data: 'custom_duty_status'
                },
                {
                    data: 'shipping_line'
                },
                {
                    data: 'shipping_line_status'
                },
                {
                    data: 'delivery_date'
                },
                {
                    data: 'cha_bill'
                },
                {
                    data: 'cha_bill_status'
                },
                {
                    data: 'cha_misc_exp'
                },
                {
                    data: 'cha_misc_exp_status'
                },
                {
                    data: 'transport'
                },
                {
                    data: 'transport_status'
                },
                {
                    data: 'uname'
                },
                {
                    data: 'created_at'
                },
                {
                    data: 'updated_at'
                },

            ],

        });
        $('#filterstatus').on('change', function() {
            table.clear()
            table.draw()
        });
        $('#todate').on('change', function() {
            table.clear()
            table.draw()
        });
        $('#fromdate').on('change', function() {
            table.clear()
            table.draw()
        });
        $(document).on('change', '.reportstatuschange', function() {
            var selectedOption = $(this).val();
            var bookingid = $(this).data('bookingid');
            $.ajax({
                type: 'POST',
                url: '<?php echo base_url('admin/Booking/update_booking_status'); ?>',
                data: {
                    selected_option: selectedOption,
                    booking_id: bookingid
                },
                success: function(response) {
                    table.clear();
                    table.draw();
                },
                error: function() {
                    alert('An error occurred while updating the database.');
                }
            });
        });

        $(document).on('click', '.upload_document', function() {
            $("#imageModel").modal('show');
            var id = $(this).data('uploadid');
            $('.modal-body_1html').html("");

            $.ajax({
                url: "<?= site_url() . 'admin/Booking/image'; ?>",
                type: 'post',
                data: {
                    id: id,
                },
                success: function(res) {
                    $('.modal-body_1html').html(res);
                }
            });
        });
        $(document).on('click', '.booking_payment', function() {
            $("#paymentModel").modal('show');
            var id = $(this).data('paymentid');
            $('.modal-body_2html').html("");
            $.ajax({
                url: "<?= site_url() . 'admin/Booking/payment'; ?>",
                type: 'post',
                data: {
                    id: id,
                },
                success: function(res) {
                    $('.modal-body_2html').html(res);
                }
            });
        });
    });
</script>