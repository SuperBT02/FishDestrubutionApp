const nodemailer = require('nodemailer');

async function sendEmail(userEmail, message){

    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.AUTH_EMAIL,
            pass: process.env.AUTH_PASSWORD,
        }
    });

    const mailOptions = {
        from: process.env.AUTH_EMAIL,
        to: userEmail,
        subject: "7outa verification",
        html:`  <h1>Houta Email Verification</h1>
                <p>Your Verification code is:</p>
                <h2 style="color:blue;">${message}</h2>
                <p>Please enter this code on the verification page to complete your registration process.</p>
                <p>If you did not request this , please ignore this email.</p>`
        
    };

    try {
        await transporter.sendMail(mailOptions);
        console.log("Verification email sent");
    } catch (error) {
        console.log("Email sending failed with an error :", error);
    }

}
async function sendMail(userEmail, message){

    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: process.env.AUTH_EMAIL,
            pass: process.env.AUTH_PASSWORD,
        }
    });

    const mailOptions2 = {
        from: process.env.AUTH_EMAIL,
        to: userEmail,
        subject: "7outa purchase",
        html:   `<h2 style="color:black; font-size:15px; font-weight:normal;">${message}</h2>`
    };

    try {
        await transporter.sendMail(mailOptions2);
        console.log("Purchase email sent");
    } catch (error) {
        console.log("Email sending failed with an error :", error);
    }

}
module.exports = { sendEmail, sendMail }; 