<?php
require("db-connect.php");

$query = "SELECT * FROM attendance";
$result = $conn->query($query);
$sessionCount=0;
setcookie('sessionCount', ++$sessionCount);
if(mysqli_num_rows($result)>0){
    while($row = $result->fetch_assoc()){
        $sessionCount = $row['session'];
        setcookie('sessionCount', ++$sessionCount);
    }
}

$query = "SELECT * FROM user WHERE role='student'";
$result = $conn->query($query);
?>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<div class="container-fluid">
<div class="panel">
    <div class="heading"><h2>Take Attendance</h2></div>
    <div class="panel-body">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Class</th>
                <th>P</th>
                <th>A</th>
            </tr>
            </thead>
            <tbody>
            <form action="" id="attendanceForm">
            <?php
            if(mysqli_num_rows($result)>0){
                $i=0;
                while($row = $result->fetch_assoc()){

                    ?>
                    <tr>
                        <input type="hidden" value="<?php echo($row['id']);?>">
                        <td><input type="text" name="name[]" value="<?php echo $row['fullname'];?>" readonly></td>
                        <td><input type="text" name="email[]" value="<?php echo $row['email'];?>" readonly</td>
                        <td><input type="text" name="class[]" value="<?php echo $row['class'];?>" readonly</td>
                        <td><input type="radio" value="present" name="present[<?php echo $i; ?>]" checked></td>
                        <td><input type="radio" value="absent" name="present[<?php echo $i; ?>]"></td>
                    </tr>


                <?php $i++;
                }
            }
            ?>
                <input id="submitAttendance" type="submit" class="btn btn-success" value="Submit Attendance" name="submitAttendance">
            </form>
            </tbody>

        </table>
    </div>
</div>
</div>
<!--
    <script>$("#submitAttendance").click(function(){
            var data = $('form#attendanceForm').serialize();
            $.ajax({
                url: 'save-attendance.php',
                method: 'post',
                data: {formData: data},
                success: function(data){
                    console.log(data);
                }
        });
        });
    </script>-->
