package com.asd.project.model;


import java.io.Serializable;
import java.util.Objects;


public class Payment implements Serializable {

    private int paymentId;
    private String email;
    private String paymentMethod;
    private long cardNumber;
    private String expiryDate;
    private String securityCode;
    private String nameOnCard;
    private String paymentDate;

    public Payment(int paymentId, String email, String paymentMethod, long cardNumber, String expiryDate, String securityCode, String nameOnCard, String paymentDate) {
        this.paymentId = paymentId;
        this.email = email;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.securityCode = securityCode;
        this.nameOnCard = nameOnCard;
        this.paymentDate = paymentDate;
    }
    public Payment() {

    }
    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getSecurityCode() {
        return securityCode;
    }

    public void setSecurityCode(String securityCode) {
        this.securityCode = securityCode;
    }

    public String getNameOnCard() {
        return nameOnCard;
    }

    public void setNameOnCard(String nameOnCard) {
        this.nameOnCard = nameOnCard;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Payment payment = (Payment) o;
        return paymentId == payment.paymentId && cardNumber == payment.cardNumber && email.equals(payment.email) && Objects.equals(paymentMethod, payment.paymentMethod) && Objects.equals(expiryDate, payment.expiryDate) && Objects.equals(securityCode, payment.securityCode) && Objects.equals(nameOnCard, payment.nameOnCard) && Objects.equals(paymentDate, payment.paymentDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(paymentId, email, paymentMethod, cardNumber, expiryDate, securityCode, nameOnCard, paymentDate);
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", email='" + email + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", cardNumber=" + cardNumber +
                ", expiryDate='" + expiryDate + '\'' +
                ", securityCode='" + securityCode + '\'' +
                ", nameOnCard='" + nameOnCard + '\'' +
                ", paymentDate='" + paymentDate + '\'' +
                '}';
    }
}
