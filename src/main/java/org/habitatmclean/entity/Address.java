package org.habitatmclean.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="address")                        // serializable must be included if this object needs
public class Address implements Serializable, RetrievableProperties{ // to be sent over a network and reconstructed elsewhere
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long address_id;

    private String street;
    private String number;
    private String apartment_no;
    private String city;
    private String state;
    private String zipcode;

    public Address() { }

    // PK + all
    public Address(Long address_id, String street, String number, String apartment_no, String city, String state, String zipcode) {
        this.address_id = address_id;
        this.street = street;
        this.number = number;
        this.apartment_no = apartment_no;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
    }

    // PK + all - apartment number
    public Address(Long address_id, String street, String number, String city, String state, String zipcode) {
        this.address_id = address_id;
        this.street = street;
        this.number = number;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
    }

    // doesn't contain an apartment number (for property DA)
    public Address(String street, String number, String city, String state, String zipcode) {
        this.street = street;
        this.number = number;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
    }

    // contains an apartment number
    public Address(String street, String number, String apartment_no, String city, String state, String zipcode) {
        this.street = street;
        this.number = number;
        this.apartment_no = apartment_no;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
    }

    @Column(name="address_id")
    public Long getAddress_id() {
        return address_id;
    }

    public void setAddress_id(Long address_id) {
        this.address_id = address_id;
    }

    @Column(name="street")
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Column(name="number")
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Column(name="apartment_no")
    public String getApartment_no() {
        return apartment_no;
    }

    public void setApartment_no(String apartment_no) {
        this.apartment_no = apartment_no;
    }

    @Column(name="city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name="state")
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Column(name="zipcode")
    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public boolean equalsPropertyAddress(Address other) {
        return true;
    }

    /*
     * comparing
     */
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Address address = (Address) o;

        if (!street.equals(address.street)) return false;
        if (number != null ? !number.equals(address.number) : address.number != null) return false;
        if (apartment_no != null ? !apartment_no.equals(address.apartment_no) : address.apartment_no != null)
            return false;
        if (!city.equals(address.city)) return false;
        if (!state.equals(address.state)) return false;
        return zipcode.equals(address.zipcode);
    }

    @Override
    public int hashCode() {
        int result = street.hashCode();
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + (apartment_no != null ? apartment_no.hashCode() : 0);
        result = 31 * result + city.hashCode();
        result = 31 * result + state.hashCode();
        result = 31 * result + zipcode.hashCode();
        return result;
    }

    @Override
    public String getValueByPropertyName(String property) {
        switch(property) {
            case "id":
                return "" + getAddress_id();
            case "street":
                return "" + getStreet();
            case "number":
                return "" + getNumber();
            case "apartment_no":
                return "" + getApartment_no();
            case "city":
                return "" + getState();
            case "state":
                return "" + getState();
            case "zipcode":
                return "" + getZipcode();
            default:
                return "invalid property specifier";
        }
    }
}
