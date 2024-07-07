<!-- <%@page contentType="text/html" pageEncoding="UTF-8" %> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product - Storee
    </title>
    <link rel="stylesheet" href="css/productdetails.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>


<body>
    <%@include file="header.jsp" %>

    <div class="container-fluid">

        <div class="row">
            <div class="imgdetails">

                <img src="${product.picture}"
                    alt="">
            </div>
            <div class="details">
                <form action="./user" method="POST">
                    <h1>${product.name}</h1>
                    <p>
                        <i class="star"></i>
                        <i class="star"></i>
                        <i class="star"></i>
                        <i class="star"></i>
                    </p>
                    <h2> $ ${product.price}</h2>
                    <h2> Color: </h2>
                    <select name="color" id="color-select">
                        <option value="black" style="background-color: black; color: white;"></option>
                        <option value="gray" style="background-color: gray;"></option>
                    </select>

                    <div id="color-box"></div>
                    <div class="size">
                        <h2>Size</h2>
                        <select name="size" class="custom-select">
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                        </select>
                    </div>
                    <div class="choose">
                        <div class="quantity">
                            <h2 style="margin-right: 5%;">Amount: </h2><input class="number" name="amount" type="text"
                                value="1" required>
                        </div>
                        
                        
                        <input name="action" value="addcart" type="hidden">
                        <input name="id" value="${product.id}" type="hidden">
                       
                    
                        <input class="submitbutt" type="submit" value="ADD TO CART">
                    </div>
                </form>
                <hr>
                <div class="details-prod">
                    <h3>Đặc Điểm Nổi Bật </h3>
                    <h4>- Thành phần: 100% cotton</h4>
                    <h4>- Hạn chế xù lông và chống nhăn</h4>
                    <h4>- Form áo: Regular, ôm nhẹ </h4>
                    <h4>- Sản xuất tại Mỹ </h4>
                </div>
            </div>
        </div>
    </div>
    <!-- feedback-->
    <div class="feedbackall">
        <div class="divleft">
            <!-- <div class="feedback-section"> -->
                    <h2>Customer Feedback</h2>
                    <form action="#" method="POST" id="formfeedback">
                        <div class="form-group">
                            <label for="name">Your Name:</label>
                            <input type="text" id="name" name="name" style="width: 250px;" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Your Email:</label>
                            <input type="email" id="email" name="email" style="width: 250px;" required>
                        </div>
                        <div class="form-group">
                            <label for="feedback">Your Feedback:</label>
                            <textarea id="feedback" name="feedback" rows="4" style="width: 250px;" required></textarea>
                        </div>
                        <button type="submit">Submit Feedback</button>
                    </form>
            <!-- </div> -->
        </div>
        <div class="divright">
            <!-- <div class="feedback-section"> -->
                <h2 style="margin-left: 40%;">Customer Feedback</h2>
                <div class="feedback-list">
                    <div class="feedback-item">
                        <p class="customer-name">John Doe</p>
                        <p class="customer-feedback">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate
                            odio sit amet nisi feugiat lacinia. </p>
                    </div>
                    <hr>
                    <div class="feedback-item">
                        <p class="customer-name">Jane Smith</p>
                        <p class="customer-feedback">Pellentesque habitant morbi tristique senectus et netus et malesuada
                            fames ac turpis egestas. .</p>
                    </div>
                    <!-- Additional feedback items can be added here -->
                </div>
            <!-- </div> -->
        </div>
    </div>


    <%@include file="footer.jsp" %>
    <script src="css/size.js"></script>
    <script>
        // JavaScript để thay đổi màu nền khi tùy chọn được chọn
        const colorSelect = document.getElementById('color-select');

        colorSelect.addEventListener('change', function () {
            const selectedColor = this.value;
            this.style.backgroundColor = selectedColor;
        });
    </script>

</body>

</html>
