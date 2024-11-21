<?php
session_start();
ob_start();
require('Assets/connection.php');
require('Assets/head.php');
require('Assets/navbar.php');
// Check if user is logged in
if (!isset($_SESSION['email'])) {
    // Redirect to login page if not logged in
    header("Location: login.php");
    exit;
}

// Fetch all appointments
$query = "SELECT * FROM appointments ORDER BY appointment_date ASC, appointment_time ASC";
$result = $conn->query($query);
?>
<section class="home-slider owl-carousel">
    <div class="slider-item bread-item" style="background-image: url('Assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container" data-scrollax-parent="true">
            <div class="row slider-text align-items-end">
                <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                    <p class="breadcrumbs" data-scrollax="properties: { translateY: '70%', opacity: 1.6 }"><span class="mr-2"><a href="index.php">Home</a></span> <span>Book appointment</span></p>
                    <h1 class="mb-3" data-scrollax="properties: { translateY: '70%', opacity: .9 }">Our Service Keeps you Smile</h1>
                </div>
            </div>
        </div>
    </div>
</section>
<?php
// Display a welcome message with the user's name
echo "<section class='ftco-section py-4'>
        <div class='container'>
            <div class='row'>
                <div class='col-12'>
                    <div class='d-flex justify-content-between align-items-center p-3 border rounded bg-light shadow-sm'>
                        <h5 class='mb-0'>Welcome, " . htmlspecialchars($_SESSION['username']) . "!</h5>
                        <div>
                            <a href='logout.php' class='btn btn-danger me-2'>Logout</a>
                            <a href='appointments_list.php' class='btn btn-secondary'>View Appointments</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </section>";
?>

<section class="ftco-section">
    <div class="container">
        <h2 class="mb-4 text-center">Appointments List</h2>

        <?php if (isset($_SESSION['success'])): ?>
            <div class="alert alert-success">
                <?php 
                echo $_SESSION['success']; 
                unset($_SESSION['success']); 
                ?>
            </div>
        <?php endif; ?>

        <?php if (isset($_SESSION['error'])): ?>
            <div class="alert alert-danger">
                <?php 
                echo $_SESSION['error']; 
                unset($_SESSION['error']); 
                ?>
            </div>
        <?php endif; ?>
<!-- Add a button to redirect to the appointment booking page -->
<div class="mb-4 text-end">
            <a href="appointment.php" class="btn btn-primary">Book New Appointment</a>
        </div>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Doctor</th>
                    <th>Appointment Date</th>
                    <th>Appointment Time</th>
                    <th>Message</th>
                    <th>Booked At</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($result->num_rows > 0): ?>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo $row['id']; ?></td>
                            <td><?php echo htmlspecialchars($row['full_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['email']); ?></td>
                            <td><?php echo htmlspecialchars($row['phone']); ?></td>
                            <td><?php echo htmlspecialchars($row['doctor']); ?></td>
                            <td><?php echo htmlspecialchars($row['appointment_date']); ?></td>
                            <td><?php echo htmlspecialchars($row['appointment_time']); ?></td>
                            <td><?php echo htmlspecialchars($row['message']); ?></td>
                            <td><?php echo htmlspecialchars($row['created_at']); ?></td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="9" class="text-center">No appointments found</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</section>

<?php require('Assets/foot.php'); ?>
<?php require('Assets/footer.php'); ?>
