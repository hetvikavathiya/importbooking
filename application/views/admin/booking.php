<div class="page-wrapper">

    <!-- Flash Message -->
    <?php $this->load->view('admin/flash_message'); ?>
    <!-- Page body -->
    <div class="page-body">
        <div class="mx-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-status-top bg-blue"></div>
                    <h3 class="card-header">
                        Booking
                    </h3>
                    <div class="card-body border-bottom py-3">
                        <div class="row ms-5">
                            <form class="row" action="<?php if (isset($update_data)) {
                                                            echo base_url('admin/Booking/index/update');
                                                        } else {
                                                            echo base_url('admin/Booking/index/add');
                                                        } ?>" method="post">
                                <input type="hidden" name="id" value="<?php if (isset($update_data)) {
                                                                            echo $update_data['id'];
                                                                        } ?>">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd"> Date: </label>
                                        <input class="form-control" type="date" name="date" value="<?php if (isset($update_data)) {
                                                                                                        echo $update_data['date'];
                                                                                                    } ?>" id="date" required>

                                    </div>
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Party Name :</label>
                                        <select class="form-select select2 " name="party_id" id="party_id">
                                            <option>Select Party</option>
                                            <?php
                                            $party = $this->db->get('party')->result();
                                            foreach ($party as $value) {
                                            ?>
                                                <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['party_id']) {
                                                                                        echo 'selected';
                                                                                    } ?>><?= $value->name; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Company Name :</label>
                                        <select class="form-select select2 " name="company_id" id="company_id">
                                            <option>Select Company</option>
                                            <?php
                                            $company = $this->db->get('company')->result();
                                            foreach ($company as $value) {
                                            ?>
                                                <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['company_id']) {
                                                                                        echo 'selected';
                                                                                    } ?>><?= $value->name; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Status </label>
                                        <select class="form-select select2 " name="status" id="status">
                                            <option value="Booking" selected>Booking</option>
                                            <option value="In-transit">In-transit</option>
                                            <option value="Arrived">Arrived</option>
                                        </select>

                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-label">Container Type</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="container" value="LCL" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['container'] == 'LCL') ? 'checked' : '' ?><?php
                                                                                                                                                                                            } else {
                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">LCL</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" value="FCL" name="container" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['container'] == 'FCL') ? 'checked' : '' ?><?php
                                                                                                                                                                                            } ?>>
                                                <span class="form-check-label">FCL</span>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Category Name :</label>
                                        <select class="form-select select2 " name="category_id" id="category_id">
                                            <option>Select category</option>
                                            <?php
                                            $category = $this->db->get('category')->result();
                                            foreach ($category as $value) {
                                            ?>
                                                <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['category_id']) {
                                                                                        echo 'selected';
                                                                                    } ?>><?= $value->name; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>

                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Quantity :</label>
                                            <input class="form-control calc" data-mqty="5555" type="number" name="quantity" id="quantity" placeholder="product quantity" value="<?php if (isset($update_data)) {
                                                                                                                                                                                    echo $update_data['quantity'];
                                                                                                                                                                                } ?>" />

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Net wt:</label>
                                            <input class="form-control" type="text" name="net_wt" id="net_wt" placeholder="product Net weight" value="<?php if (isset($update_data)) {
                                                                                                                                                            echo $update_data['net_wt'];
                                                                                                                                                        } ?>" />

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-group">
                                            <label class="form-label">Gross wt:</label>
                                            <input class="form-control" type="text" name="gross_wt" id="gross_wt" placeholder="product Gross weight" value="<?php if (isset($update_data)) {
                                                                                                                                                                echo $update_data['gross_wt'];
                                                                                                                                                            } ?>" />

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Agent Name :</label>
                                        <select class="form-select select2 " name="agent_id" id="agent_id">
                                            <option>Select Agent</option>
                                            <?php
                                            $agent = $this->db->get('agent')->result();
                                            foreach ($agent as $value) {
                                            ?>
                                                <option value="<?= $value->id; ?>" <?php if (isset($update_data) && $value->id == $update_data['agent_id']) {
                                                                                        echo 'selected';
                                                                                    } ?>><?= $value->name; ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">CHA:</label>
                                        <input class="form-control" type="text" name="CHA" id="CHA" placeholder="Enter CHA" value="<?php if (isset($update_data)) {
                                                                                                                                        echo $update_data['CHA'];
                                                                                                                                    } ?>" />

                                    </div>
                                </div>

                                <div class="row mt-2">

                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Loding Port:</label>
                                        <input class="form-control" type="text" name="loading_port" id="loading_port" placeholder="Enter Loading Port" value="<?php if (isset($update_data)) {
                                                                                                                                                                    echo $update_data['loading_port'];
                                                                                                                                                                } ?>" />


                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Discharge Port:</label>
                                        <input class="form-control" type="text" name="discharge_port" id="discharge_port" placeholder="Enter Discharge Port" value="<?php if (isset($update_data)) {
                                                                                                                                                                        echo $update_data['discharge_port'];
                                                                                                                                                                    } ?>" />


                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">Bills No:</label>
                                        <input class="form-control" type="text" name="bill_no" id="bill_no" placeholder="Enter Bill No" value="<?php if (isset($update_data)) {
                                                                                                                                                    echo $update_data['bill_no'];
                                                                                                                                                } ?>" />


                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-label">Insurance</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="insurance" value="Yes" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['insurance'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                            } else {
                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="insurance" value="No" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['insurance'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="form-label">Igm Files</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="igm_files" value="Yes" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['igm_files'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                            } else {
                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="igm_files" value="No" <?php
                                                                                                                            if (isset($update_data)) {
                                                                                                                                echo ($update_data['igm_files'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="form-label" for="prd">ETA :</label>
                                        <input class="form-control" type="text" name="ETA" id="ETA" placeholder="Enter ETA" value="<?php if (isset($update_data)) {
                                                                                                                                        echo $update_data['ETA'];
                                                                                                                                    } ?>" />


                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Custom Duty</label>
                                        <input class="form-control" type="number" step="any" name="custom_duty" id="custom_duty" placeholder="Enter custom Amount" value="<?php if (isset($update_data)) {
                                                                                                                                                                                echo $update_data['custom_duty'];
                                                                                                                                                                            } ?>" />

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-label">Custom Duty Status</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="custom_duty_status" value="Yes" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['custom_duty_status'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="custom_duty_status" value="No" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['custom_duty_status'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Shipping Line</label>
                                        <input class="form-control" type="number" name="shipping_line" id="shipping_line" placeholder="Enter Shipping line amount" value="<?php if (isset($update_data)) {
                                                                                                                                                                                echo $update_data['shipping_line'];
                                                                                                                                                                            } ?>" />

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-label">Shipping Line Status</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="shipping_line_status" value="Yes" <?php
                                                                                                                                        if (isset($update_data)) {
                                                                                                                                            echo ($update_data['shipping_line_status'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    ?> checked <?php
                                                                                                                                                                                                                            } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="shipping_line_status" value="No" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['shipping_line_status'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Delivery Date: </label>
                                        <input class="form-control" type="date" name="delivery_date" value="<?php if (isset($update_data)) {
                                                                                                                echo $update_data['delivery_date'];
                                                                                                            } ?>" id="delivery_date" required>

                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">CHA Bill</label>
                                        <input class="form-control" type="number" name="cha_bill" id="cha_bill" placeholder="Enter CHA amount" value="<?php if (isset($update_data)) {
                                                                                                                                                            echo $update_data['cha_bill'];
                                                                                                                                                        } ?>" />

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-label">CHA Bill Status</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cha_bill_status" value="Yes" checked <?php
                                                                                                                                        if (isset($update_data)) {
                                                                                                                                            echo ($update_data['cha_bill_status'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cha_bill_status" value="No" <?php
                                                                                                                                if (isset($update_data)) {
                                                                                                                                    echo ($update_data['cha_bill_status'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                                    } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">CHA misc exp</label>
                                        <input class="form-control" type="number" name="cha_misc_exp" id="cha_misc_exp" placeholder="Enter CHA misc exp" value="<?php if (isset($update_data)) {
                                                                                                                                                                    echo $update_data['cha_misc_exp'];
                                                                                                                                                                } ?>" />

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-label">CHA Bill Exp Status</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cha_misc_exp_status" value="Yes" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['cha_misc_exp_status'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                ?> checked <?php
                                                                                                                                                                                                                        } ?>>
                                                <span class="form-check-label">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="cha_misc_exp_status" value="No" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['cha_misc_exp_status'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                                            } ?>>
                                                <span class="form-check-label">No</span>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-sm-3">
                                        <label class="form-label" for="prd">Transport</label>
                                        <input class="form-control" type="number" name="transport" id="transport" placeholder="Enter Transport Amount" value="<?php if (isset($update_data)) {
                                                                                                                                                                    echo $update_data['transport'];
                                                                                                                                                                } ?>" />

                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-label">Transport Status</div>
                                        <div>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="transport_status" value="Yes" <?php
                                                                                                                                    if (isset($update_data)) {
                                                                                                                                        echo ($update_data['transport_status'] == 'Yes') ? 'checked' : '' ?><?php
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            ?> checked <?php
                                                                                                                                                                                                                    } ?>>
                                                <span class="form-check-label" value="Yes">Yes</span>
                                            </label>
                                            <label class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="transport_status" value="No" <?php
                                                                                                                                if (isset($update_data)) {
                                                                                                                                    echo ($update_data['transport_status'] == 'No') ? 'checked' : '' ?><?php
                                                                                                                                                                                                    } ?>>
                                                <span class="form-check-label" value="No">No</span>
                                            </label>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2 ">
                                        <label class="form-label" for="prd"> &nbsp </label>
                                        <input class="btn btn-primary " type="submit" value="<?= isset($update_data) ? "UPDATE BOOKING" : "BOOKING" ?>">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>