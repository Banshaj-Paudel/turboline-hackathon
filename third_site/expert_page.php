7:07 AM
Prabhat
Prabhat Basnet
<?php include('layouts/header.php');    ?>
<style>
    #expert {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        margin-top: 10%;
        
    }

    .expert .p-name{
      padding: 5%;
    }

    .expert {
        width: 100%;
        max-width: 300px; /* Adjust the max-width as needed */
        margin: 0 auto;
    }

    .expert img {
        width: 100%;
        height: auto;
        border-radius: 50%; /* Optional: Adds rounded corners to the image */
    }
</style>

<section id="expert">
    <div>
        <h3 class="heading">Our Experts</h3>
        <p id="design-element"></p>
    </div>
<div class="expert-container">
    <div class="expert">
        <img src="/assets/images/founder1.jpg" alt="Mr. Prabhat Basnet"/>
        <h5 class="p-name">Mr. Prabhat Basnet</h5>
        <h4 class="p-desc">Co-Founder of Saadhanu and Car Expert</h4>
        <h5 class="p-email">Email Address: <span>pb_saadhanu@gmail.com</span></h5>
        <h5 class="p-call">Call For Expert Opinion: <span>123456789</span></h5>
    </div>

    <div class="expert">
        <img src="/assets/images/founder2.jpg" alt="Mr. Swastik Karki"/>
        <h5 class="p-name">Mr. Swastik Karki</h5>
        <h4 class="p-desc">Co-Founder of Saadhanu and Two-wheeler Expert</h4>
        <h5 class="p-email">Email Address: <span>sk_saadhanu@gmail.com</span></h5>
        <h5 class="p-call">Call For Expert Opinion: <span>123457698</span></h5>
  </div>
    </div>
  </section>
 <!-- Site footer -->
 <?php include('layouts/footer.php');    ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>