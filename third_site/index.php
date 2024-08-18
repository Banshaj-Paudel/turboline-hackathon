

<?php include('layouts/header.php');   ?>



      <!--Home-->
      <section id="home">
        <div class="container">
            <h5> Verified Used <br> Vehicles on </h5>
            <h1> <span> Great </span> Prices </h1>
            <p> Saadhanu Simplifies <br> Buying and Selling of <br> Vehicles </p>
            <a href="vehicle.php"><button class="BuyNow"> Buy Now! </button></a>
             </div>

      </section>

      <!--Brand-->
      <section id="brand" class="container">
        <div class="row">
            <h3 class="heading text-center">Range of Different Brands </h3>
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b2.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b3.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b5.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b6.png" alt="">
             
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b7.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b8.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/b9.png" alt="">
            <img class="img-fluid col-lg-3 col-md-6 col-sm-12" src="/assets/images/cbrand4.png" alt="">
        </div>

      </section>

      <!-- new -->
      <section id="new" class="w=100">
        <div class="row p-0 m-0">
            <!--One -->
            <div class="one col-lg-4 col-md-12 col-sm-12 p-0">
                <img class="img-fluid" src="assets/images/1.png" alt="">
                <div class="details">
                  <h2> Newly Listed Two-Wheelers </h2>
                 <a href="vehicle.php"> <button class="BuyNow"> Check </button> </a>
             </div>
            </div>

            <!--Two-->
            <div class="one col-lg-4 col-md-12 col-sm-12 p-0">
                <img class="img-fluid" src="assets/images/2.png" alt="">
                <div class="details">
                  <h2> Newly Listed Cars </h2>
                  <a href="vehicle.php"> <button class="BuyNow"> Check </button> </a>
             </div>
            </div>

            <!--Three -->
            <div class="one col-lg-4 col-md-12 col-sm-12 p-0">
                <img class="img-fluid" src="assets/images/3.png" alt="">
                <div class="details">
                  <h2> Special Offers </h2>
                  <a href="vehicle.php"> <button class="BuyNow"> Check </button> </a>
             </div>
            </div>

              </div>
      </section>
    
      <!--featured products -->
      <section id="featured_twowheel" class="my-5 pb-5">
        <div class="container text-center mt-5 py-5">
          <h3> Great Deals </h3>
          <p id="design-element"></p>
          <p> Get Newer Models in Great Prices </p>
          <h4> Two-wheelers </h4>
          <p id="design-element"></p>
        </div>
          

        <div class="row mx-auto container-fluid">

        <?php
          include('server/get_twowheel.php');
        ?>

        <?php while($row= $twowheel->fetch_assoc()){ ?>
          <div class="product text-center col-lg-3 col-md-4 col-sm-12">
            <img class="img-fluid mb-3" src="/assets/images/<?php echo $row['vehicle_image']; ?>"/>
            <h5 class="p-name"> <?php echo $row['vehicle_name']; ?> </h5>
            <h4 class="p-price"> Rs. <?php echo $row['vehicle_price']; ?> </h4>
            <a href="<?php echo "vehicle_details.php?vehicle_id=".$row['vehicle_id'];?>"> <button class="BuyNow"> Check Now! </button></a>
        </div>

             

        <?php } ?>

        
        </div>
      </section>
       <section id="featured_car" class="my-5 pb-5">
        <div class="container text-center mt-5 py-5">
          
          <h4> Cars </h4>
          <p id="design-element"></p>
           </div>
          

        <div class="row mx-auto container-fluid">

      
        

       <?php include('server/get_car.php');  ?>
        <?php  while($row= $car->fetch_assoc()){ ?>
          <div class="product text-center col-lg-3 col-md-4 col-sm-12">
            <img class="img-fluid mb-3" src="/assets/images/<?php echo $row['vehicle_image']; ?>"/>
            <h5 class="p-name"> <?php echo $row['vehicle_name']; ?> </h5>
            <h4 class="p-price"> Rs. <?php echo $row['vehicle_price']; ?> </h4>
            <a href="<?php echo "vehicle_details.php?vehicle_id=".$row['vehicle_id'];?>"> <button class="BuyNow"> Check Now! </button></a>
             </div>

             

        <?php }  ?>

        </div>
        </section>
      <?php include('layouts/footer.php');   ?>

    