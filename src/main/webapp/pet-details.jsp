<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>${pet.name} - Details</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 30px;
            background: radial-gradient(circle at 20% 50%, rgba(0, 212, 255, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(9, 9, 121, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%),
                        linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            background-attachment: fixed;
            color: #333;
            overflow-x: hidden;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><defs><pattern id="a" patternUnits="userSpaceOnUse" width="100" height="100"><circle cx="50" cy="50" r="2" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100%" height="100%" fill="url(%23a)"/></svg>');
            pointer-events: none;
            z-index: -1;
        }

        @keyframes slideInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        a {
            text-decoration: none;
            color: #00d4ff;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        a:hover {
            color: #090979;
            transform: scale(1.05);
        }

        .container {
            max-width: 900px;
            background: linear-gradient(145deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
            backdrop-filter: blur(20px);
            margin: 0 auto;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 50px;
            animation: slideInUp 1.5s ease-out;
            position: relative;
            border: 1px solid rgba(255,255,255,0.3);
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: conic-gradient(from 0deg, transparent, rgba(0,212,255,0.1), transparent);
            animation: rotate 15s linear infinite;
            pointer-events: none;
        }

        h1 {
            font-weight: 700;
            font-size: 3em;
            margin-bottom: 30px;
            color: #090979;
            text-align: center;
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .pet-image {
            display: block;
            max-width: 350px;
            width: 100%;
            height: auto;
            border-radius: 20px;
            margin: 0 auto 40px;
            box-shadow: 0 10px 30px rgba(0,212,255,0.3);
            object-fit: cover;
            transition: transform 0.4s ease;
        }

        .pet-image:hover {
            transform: scale(1.05);
        }

        ul.details-list {
            list-style-type: none;
            padding: 0;
            max-width: 600px;
            margin: 0 auto 50px;
        }

        ul.details-list li {
            background: linear-gradient(145deg, rgba(0,212,255,0.1), rgba(9,9,121,0.1));
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            font-size: 1.2rem;
            display: flex;
            justify-content: space-between;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            font-weight: 600;
            color: #333;
            transition: transform 0.3s ease;
        }

        ul.details-list li:hover {
            transform: translateY(-5px);
        }

        ul.details-list li strong {
            font-weight: 700;
            color: #090979;
        }

        .back-link {
            display: block;
            text-align: center;
            font-size: 1.2rem;
            padding: 15px 30px;
            border: 2px solid #00d4ff;
            border-radius: 50px;
            max-width: 250px;
            margin: 0 auto 30px;
            background: rgba(255,255,255,0.8);
            transition: all 0.4s ease;
            position: relative;
            z-index: 2;
        }

        .back-link:hover {
            background: linear-gradient(135deg, #00d4ff, #090979);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(0,212,255,0.4);
        }

        #buy-now-btn {
            padding: 15px 40px;
            background: linear-gradient(135deg, #00d4ff 0%, #090979 100%);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1.2rem;
            cursor: pointer;
            font-weight: 700;
            transition: all 0.4s ease;
            box-shadow: 0 10px 30px rgba(0,212,255,0.4);
            position: relative;
            z-index: 2;
            overflow: hidden;
            display: block;
            margin: 20px auto;
        }

        #buy-now-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        #buy-now-btn:hover::before {
            left: 100%;
        }

        #buy-now-btn:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 20px 40px rgba(0,212,255,0.6);
            background: linear-gradient(135deg, #090979 0%, #00d4ff 100%);
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px;
            }
            h1 {
                font-size: 2.2em;
            }
            ul.details-list li {
                flex-direction: column;
                text-align: center;
                font-size: 1rem;
            }
            ul.details-list li strong {
                margin-bottom: 8px;
                display: block;
            }
            .pet-image {
                max-width: 100%;
            }
            .back-link {
                max-width: 200px;
                padding: 12px 25px;
            }
            #buy-now-btn {
                padding: 12px 30px;
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>${pet.name} - Details</h1>

    <img src="${pet.imagePath}" alt="${pet.name}" class="pet-image" />

    <ul class="details-list">
        <li><strong>Type:</strong> <span>${pet.type}</span></li>
        <li><strong>Description:</strong> <span>${pet.description}</span></li>
        <li><strong>Height:</strong> <span>${pet.petDetails.height} cm</span></li>
        <li><strong>Weight:</strong> <span>${pet.petDetails.weight} kg</span></li>
        <li><strong>Age:</strong> <span>${pet.petDetails.age} years</span></li>
        <li><strong>Breed:</strong> <span>${pet.petDetails.breed}</span></li>
        <li><strong>Atmosphere:</strong> <span>${pet.petDetails.atmosphere}</span></li>
        <li><strong>Price:</strong> <span>₹ ${pet.petDetails.price}</span></li>
    </ul>

    <a href="<%= request.getContextPath() %>/home" class="back-link">← Back to Home</a>


    <input type="hidden" id="petId" value="${pet.id}" />
    <input type="hidden" id="price" value="${pet.petDetails.price}" />

    <button id="buy-now-btn">Buy Now</button>

    <script>
        const contextPath = '<%= request.getContextPath() %>';
    </script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script>
        document.getElementById('buy-now-btn').onclick = async function(e) {
            e.preventDefault();

            const petId = document.getElementById('petId').value;
            const price = document.getElementById('price').value;

            const formData = new URLSearchParams();
            formData.append('amount', price * 100); // convert to paise

            try {
                const createOrderResponse = await fetch(contextPath + '/create', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: formData
                });

                const orderId = await createOrderResponse.text();

                if (!createOrderResponse.ok) {
                    alert("Error creating order: " + orderId);
                    return;
                }

                // Razorpay options
                const options = {
                    "key": "rzp_test_RUbVPhfphul9mV",
                    "amount": price * 100,
                    "currency": "INR",
                    "name": "Your Pet Shop",
                    "description": "Purchase Pet",
                    "order_id": orderId,
                    "handler": async function (response) {
                        const verifyFormData = new URLSearchParams();
                        verifyFormData.append("razorpay_payment_id", response.razorpay_payment_id);
                        verifyFormData.append("razorpay_order_id", response.razorpay_order_id);
                        verifyFormData.append("razorpay_signature", response.razorpay_signature);
                        verifyFormData.append("petId", petId);

                        const verifyResponse = await fetch(contextPath +'/VerifyPaymentServlet', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            },
                            body: verifyFormData
                        });

                        if (verifyResponse.ok) {
                            alert("Payment successful..! ");
                            window.location.href = contextPath +"/home";
                        } else {
                            const errorText = await verifyResponse.text();
                            alert("Verification failed: " + errorText);
                        }
                    },
                    "theme": {
                        "color": "#00d4ff"
                    }
                };

                const rzp = new Razorpay(options);
                rzp.open();

            } catch (err) {
                alert("Error: " + err.message);
            }
        }
    </script>
</div>

</body>
</html>