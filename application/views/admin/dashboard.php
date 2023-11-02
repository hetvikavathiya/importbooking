<div class="page-wrapper">
    <!-- Page header -->
    <div class="page-header d-print-none">
        <div class="mx-4">
            <div class="row g-2 align-items-center">
                <div class="col">

                    <h2 class="page-title">
                        Admin Dashboard
                    </h2>
                </div>
            </div>
            <!-- Flash Message -->
            <?php $this->load->view('admin/flash_message'); ?>
        </div>
    </div>
    <div class="page-body">
        <div class="mx-4">
            <div class="row mb-2">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="font-weight-medium">
                                        <?php
                                        $this->db->where('status', 'Booking ');
                                        $bookingCount = $this->db->count_all_results('booking');
                                        echo "Total Numbers of Booking records :  " . $bookingCount;
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="font-weight-medium">
                                        <?php
                                        $this->db->where('status', 'In-transit');
                                        $in_transitCount = $this->db->count_all_results('booking');
                                        echo "Total Numbers of In-transit records :  " . $in_transitCount;
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="font-weight-medium">
                                        <?php
                                        $this->db->where('status', 'Arrived');
                                        $arrivedCount = $this->db->count_all_results('booking');
                                        echo "Total Numbers of Arrived records :  " . $arrivedCount;
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="font-weight-medium">
                                        <?php
                                        $this->db->where('container', 'LCL');
                                        $LCL = $this->db->count_all_results('booking');
                                        echo "Total Numbers of LCL records :  " . $LCL;
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row mb-2">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-sm">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col">
                                    <div class="font-weight-medium">
                                        <?php
                                        $this->db->where('container', 'FCL ');
                                        $FCL = $this->db->count_all_results('booking');
                                        echo "Total Numbers of FCL records :  " . $FCL;
                                        ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>