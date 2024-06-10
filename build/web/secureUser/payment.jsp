<%-- 
    Document   : payment
    Created on : Apr 5, 2022, 11:42:12 PM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="model.CartInfo"%>

<%
    String name = "erhao";
    List<CartInfo> cartList = (List<CartInfo>) session.getAttribute("cartList");
    String[] paymentId =  (String[]) session.getAttribute("paymentId");
    String[] userId =  (String[]) session.getAttribute("userId");
    String[] cartId =  (String[]) session.getAttribute("cartId");
    String[] productId =  (String[]) session.getAttribute("productId");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="../images/logo.png"/>
        <title>Payment</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/fonts/roboto/Roboto-Regular.woff">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.7/css/swiper.min.css">
        <link rel="stylesheet" href="../css/payment.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.3.4/vue.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/vuex/3.0.1/vuex.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.16.2/axios.min.js"></script>
        <script src="https://dawa.aws.dk/js/autocomplete/dawa-autocomplete2.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.7/js/swiper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper@3.1.2/dist/vue-awesome-swiper.js"></script>
        <script src="https://unpkg.com/vuelidate@0.6.2/dist/vuelidate.min.js"></script>
        <script src="https://unpkg.com/vuelidate@0.6.2/dist/validators.min.js"></script>
        <!-- <script src="payment.js"></script> -->


        <!--modal-->
        <link rel="stylesheet" href="../css/payment_modal.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="../js/payment_modal.js"></script>

        <!--sweetalert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <style>
            .indigo.darken-4 {
                background-color: black !important;
            }

            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }
        </style>

    </head>

    <body>
        <form class="col s12" action="PaymentUpdate" method="post" id="paymentForm">
            <div id="app" v-cloak>
                <%--<%@include file="include/header.jsp" %>--%>
                <div class="header">
                    <nav class="indigo darken-4">
                        <div class="nav-wrapper container">
                            <a href="cart.jsp" class="brand-logo">Go Back<i
                                    class="material-icons">keyboard_backspace</i></a>
                        </div>
                    </nav>
                    <div class="progress-container hide-on-med-and-up">
                        <div class="progress-bar js-progress-bar"></div>
                    </div>
                </div>
                <div class="container wrapper">
                    <div class="row hide-on-med-and-up" v-cloak>
                        <div class="col s12 m6">
                            <div class="card">
                                <div class="card-content">
                                    <p><b>Items in cart:</b> {{cartSummary.length}}</p>
                                    <p><b>Shipping:</b> {{chosenShippingMethod.name}} - ${{shippingPrice}}</p>
                                    <p><b>Total:</b> ${{basketTotal}}</p>
                                    <span class="small-text grey-text text-darken-2 m-top-10 ">Fill out the information below
                                        and go directly to payment by clicking the button.</span>
                                </div>
                                <a v-on:click="scrollToBottom(); $v.name.$touch(); $v.address.$touch(); $v.email.$touch(); $v.phone.$touch();"
                                   class="btn-floating halfway-fab waves-effect waves-light red"><i
                                        class="material-icons">arrow_downward
                                    </i></a>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m6">
                            <div class="card" id="step-1">
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><b>Information</b></span>
                                    <div class="row m-top-15">

                                        <div class="row">
                                            <div class="input-field col s12 l6 m-top-15">
                                                <input id="city" 
                                                       v-model="city" type="text" class="validate"
                                                       autocomplete="name" name="city">
                                                <label for="city">City</label>


                                            </div>
                                            <div class="input-field col s12 l6 m-top-15">
                                                <input id="zip" v-model="zip"
                                                       type="text" class="validate" name="zip">
                                                <label for="zip">Zip Code</label>
                                            </div>
                                        </div>
                                        <div class="row m-top-15">
                                            <div class="input-field col s12">
                                                <input id="address"
                                                       @blur="$v.address.$touch()"  class="validate"
                                                       v-model="address" type="text"  name="address">
                                                <label for="address">Address</label>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12 l6 m-top-15">
                                                <input id="state" v-model="state"
                                                       type="text" class="validate" name="state">
                                                <label for="state">State</label>
                                            </div>
                                            <div class="input-field col s12 l6 m-top-15">
                                                <input id="country" v-model="country"
                                                       type="text" class="validate" name="country">
                                                <label for="country">Country</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card" id="step-2" v-cloak>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><b>Shipping</b></span>
                                    <p>Pleasse choose your desired shipping provider.</p>

                                    <p class="p-top-10" v-for="(shippingMethod, index) in shippingMethods">
                                        <label>
                                            <input v-model="shipping" name="group1" :value="shippingMethod.id" type="radio"
                                                   :id="shippingMethod.id" class="with-gap m-top-15" />
                                            <span>{{shippingMethod.desc}} - RM{{shippingMethod.price}}</span>
                                        </label>
                                    </p>



                                </div>
                            </div>

                        </div>
                        <div class="col s12 m6">
                            <div class="card" id="step-4" v-cloak>
                                <div class="card-content">
                                    <span class="card-title activator grey-text text-darken-4"><b>Order summary</b></span>
                                    <div class="row info">
                                        <div class="col s12 m6">
                                            <p><b>Billing address:</b></p>
                                            <p>{{ name }}</p>
                                            <p>{{ company }}</p>
                                            <p>{{ addressComputed }}</p>
                                            <p>{{ cityComputed }}</p>
                                            <p>{{ countryComputed }}</p>
                                            <p>{{ email }}</p>
                                            <p>{{ phone }}</p>
                                        </div>
                                    </div>
                                    <span class="card-title activator grey-text text-darken-4 m-top-15"><b>Your order</b></span>
                                    <div class="row">
                                        <div class="input-field col s6 l4">
                                            <span><b>{{ products.length }} items</b></span>
                                        </div>
                                        <div class="input-field col s6 l4">
                                            <span><b>&emsp;&emsp;Size</b></span>
                                        </div>
                                        <div class="input-field col s6 l4">
                                            <span><b>Qty</b></span>
                                        </div>
                                    </div>
                                    <ul class="collection">
                                        <li class="collection-item avatar" ref="item-1" v-for="(product, index) in products">
                                            <img :src="product.image" alt="" class="circle">
                                            <div class="row">
                                                <div class="col s12 l4">
                                                    <span class="title">{{ product.name }}</span>
                                                    <p>RM{{ product.price }}</p>
                                                </div>
                                                <div class="input-field col s6 l4">{{ product.size }}</div>
                                                <div class="input-field col s6 l4">{{ product.qty }}</div>
                                            </div>

                                        </li>
                                    </ul>
                                    <ul>
                                        <li v-if="shipping">
                                            <span><b>Shipping</b> <i>{{chosenShippingMethod.desc}}</i></span>
                                            <span class="right">RM{{chosenShippingMethod.price}}</span>
                                        </li>
                                        <li v-if="taxTotal">
                                            <span><b>TAX</b></span>
                                            <span class="right">RM{{taxTotal}}</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-action" v-if="basketTotal">
                                    <span><b>Total</b></span>
                                    <span class="right"><b>RM{{basketTotal}}</b></span>
                                    <span class="store_basketTotal" style="display:none"><b>{{basketTotal}}</b></span>
                                    <input type="hidden" id="basketTotal" name="basketTotal" value="">
                                </div>
                                <div class="card-action">
                                    <span class="card-title activator grey-text text-darken-4"><b>Payment</b></span>
                                    <p class="payment-info">Please choose your desired payment method. Credit card option will
                                        redirect you to the payment gateway.</p>
                                    <p>
                                        <label>
                                            <input type="checkbox" v-model="consent" class="filled-in" name="consent" id="consent"/>
                                            <span>I hereby confirm that the information that I have provided is correct and that
                                                I accept the <a href="#" class="indigo-text text-darken-4">Terms and
                                                    Conditions</a></span>
                                        </label>
                                    </p>

                                    <button ref="link" id="CODbtn" type="button"
                                            class="waves-effect waves-light btn-credit-card orange"><i
                                            class="material-icons left" >local_atm</i>Cash On Delivery</button>
                                    &nbsp;&nbsp;
                                    <button ref="link" data-toggle="modal" data-target="#exampleModal" type="button"
                                            class="waves-effect waves-light btn-credit-card blue-grey"><i
                                            class="material-icons left">credit_card</i>Pay with Credit Card</button>
                                </div>

                                <% for (int i = 0; i < cartId.length; i++) { %>
                                <input type="hidden" id="paymentId" name="paymentId" value="<%= paymentId[i] %>">
                                <input type="hidden" id="productId" name="productId" value="<%= productId[i] %>">
                                <input type="hidden" id="userId" name="userId" value="<%= userId[i] %>">
                                <input type="hidden" id="cartId" name="cartId" value="<%= cartId[i] %>">
                                <% }%>


                                <input type="hidden" id="payment_method" name="payment_method" value="">

                                <input type="hidden" id="credit_card_name" name="credit_card_name" value="">
                                <input type="hidden" id="credit_card_number" name="credit_card_number" value="">
                                <input type="hidden" id="credit_card_expDate" name="credit_card_expDate" value="">
                                <input type="hidden" id="credit_card_cvv" name="credit_card_cvv" value="">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!--modal-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Peace <img src="../images/logo.png" alt="alt"/ style="max-width:5%;max-height: 5%"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="POST">
                            <h3>Payment</h3>
                            <label for="fname">Accepted Cards</label>
                            <div class="icon-container">
                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                            </div>
                            <div class="form-group">
                                <label for="cname" class="col-form-label">Name on Card:</label>
                                <input type="text" class="form-control" id="cname" name="cardname"
                                       placeholder="John More Doe">
                            </div>
                            <div class="form-group">
                                <label for="ccnum" class="col-form-label">Credit card number:</label>
                                <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444"
                                       class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="expdate" class="col-form-label">Exp Date</label>
                                <input type="text" id="expdate" name="expdate" placeholder="02/26" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="cvv" class="col-form-label">CVV:</label>
                                <input type="text" id="cvv" name="cvv" placeholder="352" class="form-control">
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="CCbtn">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
var i = 0;
var product = [];
        </script>

        <%
            for (CartInfo cart : cartList) {
        %>
        <script>

            product[i] = {
                id: "<%=cart.getCart().getCartPK().getCartId()%>",
                name: "<%=cart.getProduct().getProductTitle()%>",
                image:
                        "../images/" + "<%=cart.getProduct().getProductImage()%>",
                price: <%=String.format("%.2f", cart.getProduct().getProductAmount())%>,
                size: "<%=cart.getCart().getOrdersize()%>",
                qty: <%=cart.getCart().getQuantity()%>
            };
            i++;
        </script>
        <%}%>



        <script>

            Vue.use(Vuex);
            Vue.use(VueAwesomeSwiper);
            Vue.use(window.vuelidate.default);
            const {required, email, numeric} = window.validators;

            const store = new Vuex.Store({
                state: {
                    products: product.slice(), //clone the product array and return a reference to a new array: products
                    shippingMethods: [
                        {
                            id: "gls",
                            name: "GLS",
                            desc: "GLS - Package delivered directly to the door",
                            price: "10",
                            type: "private"
                        },
                        {
                            id: "fedex",
                            name: "FedEx",
                            desc: "FedEx - Package delivered directly to the door",
                            price: "10",
                            type: "private"
                        },
                        {
                            id: "dhl",
                            name: "DHL",
                            desc: "DHL - Package delivered directly to your company",
                            price: "12",
                            type: "company"
                        }
                    ],
                    basket: {
                        basketId: "234235",
                        basketTotal: 0,
                        orderlines: [],
                        shippingPrice: 10
                    }
                },
                mutations: {
                    setBasketOrderline(state, product) {
                        product.quantity = 1;
                        state.basket.orderlines.push(product);
                    },
                    setShippingPrice(state, price) {
                        state.basket.shippingPrice = state.basket.shippingPrice + parseInt(price);
                        store.dispatch("reCalculateBasket");
                    },
                    setOrderlineValues(state, props) {
                        var orderline = state.basket.orderlines.find(
                                x => x.id === props.productId
                        );
                        orderline.quantity = parseInt(props.quantity);
                        orderline.price = orderline.price * parseInt(props.quantity);
                        store.dispatch("reCalculateBasket");
                    },
                    reCalculateBasket(state) {
                        var totalProductPrice = 0;
                        state.basket.basketTotal = 0; // Reset basketTotal
                        $.each(state.basket.orderlines, function (index, product) { //calculate total price
                            totalProductPrice = totalProductPrice + (product.price * product.qty);
                        });

                        state.basket.basketTotal =
                                state.basket.basketTotal +
                                totalProductPrice +
                                state.basket.shippingPrice;
                    },
                    removeProduct(state, productId) {
                        state.basket.orderlines = $.grep(state.basket.orderlines, function (
                                orderline
                                ) {
                            return orderline.id != productId;
                        });
                        state.products = $.grep(state.products, function (product) {
                            return product.id != productId;
                        });
                        store.dispatch("reCalculateBasket");
                    }
                },
                actions: {
                    initializeBasket(context, products) {
                        $.each(products, function (index, product) {
                            context.commit("setBasketOrderline", product);
                            context.commit("reCalculateBasket");
                        });
                    },
                    calculateShipping(context, price) {
                        context.commit("setShippingPrice", price);
                    },
                    updateOrderline(context, props) {
                        context.commit("setOrderlineValues", {
                            productId: props.productId,
                            quantity: props.quantity
                        });
                    },
                    reCalculateBasket(context) {
                        context.commit("reCalculateBasket");
                    },
                    removeProduct(context, productId) {
                        context.commit("removeProduct", productId);
                    }
                },
                getters: {}
            });

            new Vue({
                el: "#app",
                name: "CheckOut",
//                components: {
//                    "quantity-select": quantitySelect
//                },
                store,
                data: function () {
                    return {
                        name: "<%= name %>",
                        company: "",
                        email: "",
                        phone: "",
                        address: "",
                        city: "",
                        zip: "",
                        state: "",
                        country: "",
                        showAlternative: false,
                        sizes: ["S", "M", "L", "XL"],
                        shipping: "gls",
                        showVoucher: "",
                        consent: "",
                        swiperOptions: {
                            slidesPerView: 4,
                            spaceBetween: 10,
                            roundLengths: true, // fix blurry text
                            watchSlidesProgress: true,
                            watchSlidesVisibility: true,
                            pagination: {
                                el: ".swiper-pagination",
                                clickable: true
                            },
                            navigation: {
                                nextEl: ".swiper-button-next",
                                prevEl: ".swiper-button-prev"
                            },
                            breakpoints: {
                                2166: {
                                    slidesPerView: 3.2
                                },
                                1920: {
                                    slidesPerView: 3
                                },
                                1640: {
                                    slidesPerView: 2.6
                                },
                                1440: {
                                    slidesPerView: 2.3
                                },
                                1250: {
                                    slidesPerView: 1.8
                                },
                                640: {
                                    slidesPerView: 1.6
                                }
                            },
                            on: {
                                init: function () {
                                    // Hide pagination if only one is present
                                    var paginationBullets = $(".swiper-pagination");
                                    if (paginationBullets.length == 1) {
                                        paginationBullets.hide();
                                    }
                                }
                            }
                        }
                    };
                },
                validations: {
                    name: {
                        required
                    },
                    address: {
                        required
                    },
                    address: {
                        required
                    },
                    email: {
                        required,
                        email
                    },
                    phone: {
                        required,
                        numeric
                    }
                },
                created: function () {
                    this.$store.dispatch("initializeBasket", this.products);
                    this.scrollIndicator();
                },
                mounted: function () {
                    var _self = this;
                    dawaAutocomplete.dawaAutocomplete(
                            document.getElementById("dawa-autocomplete-input"),
                            {
                                select: function (selected) {
                                    _self.address = selected.data.vejnavn;
                                    _self.houseNumber = selected.data.husnr;
                                    _self.floor = selected.data.etage;
                                    _self.door = selected.data.dør;
                                    _self.city = selected.data.postnrnavn;
                                    _self.zip = selected.data.postnr;
                                    _self.addressInput = selected.tekst;
                                }
                            }
                    );
                    this.$nextTick(function () {
                        window.addEventListener("resize", this.reorderDiv());
                    });
                },
                computed: {
                    swiper() {
                        return this.$refs.awesomeSwiper.swiper;
                    },
                    addressComputed() {
                        var address = this.address ? this.address + " " : "";
                        var houseNumber = this.houseNumber ? this.houseNumber : "";
                        var floor = this.floor ? ", " + this.floor + ". " : "";
                        var door = this.door ? this.door : "";

                        return address + houseNumber + floor + door;
                    },
                    cityComputed() {
                        return this.zip + " " + this.city + " " + this.state;
                    },
                    countryComputed() {
                        return this.country;
                    },
                    delAddressComputed() {
                        var address = this.delAddress ? this.delAddress + " " : "";
                        var houseNumber = this.delHouseNumber ? this.delHouseNumber : "";
                        var floor = this.delFloor ? ", " + this.delFloor + ". " : "";
                        var door = this.delDoor ? this.delDoor : "";

                        return address + houseNumber + floor + door;
                    },
                    delCityComputed() {
                        return this.delZip + " " + this.delCity;
                    },
                    products() {
                        return this.$store.state.products;
                    },
                    shippingMethods() {
                        return this.$store.state.shippingMethods;
                    },
                    taxTotal() { // return tax total
                        var tax = this.$store.state.basket.basketTotal * 0.015;
                        return  (tax.toFixed(2));
                    },
                    basketTotal() { // return Total Price
                        var tax = this.$store.state.basket.basketTotal * 0.015;
                        return (this.$store.state.basket.basketTotal + tax).toFixed(2);
                    },
                    shippingPrice() {
                        return this.$store.state.basket.shippingPrice;
                    },
                    chosenShippingMethod() {
                        return this.shippingMethods.find(x => x.id === this.shipping);
                    },
                    cartSummary() {
                        var cartSummary = [];
                        $.each(this.products, function (index, product) {
                            cartSummary.push(product.name);
                        });

                        return cartSummary;
                    }
                },
                watch: {
                    shipping: {
                        handler: function (shipping, oldShipping) {
                            var price = this.shippingMethods.find(x => x.id === shipping).price;
                            var oldPrice = this.shippingMethods.find(x => x.id === oldShipping)
                                    .price;
                            this.calculateShipping(price, oldPrice);
                        },
                        deep: true
                    }
                },
                methods: {
                    fetchData(event) {
                        event.preventDefault();
                        var _self = this;
                        var apiURL = "https://dawa.aws.dk/adresser/autocomplete";

                        axios
                                .get(apiURL, {
                                    params: {
                                        q: _self.addressInput
                                    }
                                })
                                .then(function (response) {
                                    _self.addresses = response.data;
                                })
                                .catch(function (error) {
                                    console.log(error.message);
                                });
                    },
                    deleteItem(productId) {
                        console.log(productId);
                        this.$store.dispatch("removeProduct", productId);
                    },
                    calculateShipping(price, oldPrice) {
                        if (oldPrice !== undefined) {
                            this.$store.dispatch("calculateShipping", -oldPrice);
                        }
                        this.$store.dispatch("calculateShipping", price);
                    },
                    setCompanyShipping() {
                        if (this.company) {
                            this.shipping = "dhl";
                        }
                    },
                    scrollToBottom() {
                        if (!this.$v.$invalid) {
                            $("html,body").animate({scrollTop: document.body.scrollHeight}, "slow");
                        }
                    },
                    reorderDiv() {
                        if ($(window).width() < 960) {
                            $("#step-3").insertBefore("#step-2");
                        }
                    },
                    scrollIndicator() {
                        window.onscroll = function () {
                            var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
                            var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
                            var scrolled = winScroll / height * 100;

                            $(".js-progress-bar").width(scrolled + "%");
                        };
                    },
                    goToPayment(event) {
                        event.preventDefault();

                        if (!this.$v.$invalid) {
                            location.href = this.$refs.link.attributes.href.nodeValue;
                        } else if (this.$v.name.$invalid || this.$v.address.$invalid || this.$v.email.$invalid || this.$v.phone.$invalid) {
                            $('html, body').animate({scrollTop: ($('#step-1').offset().top)}, "slow");
                        } else if (this.$v.consent.$invalid) {
                            $('html, body').animate({scrollTop: document.body.scrollHeight}, "slow");
                        }
                    }
                }
            });

            $(document).ready(function () {
                $("select").formSelect();
            });
        </script>

        <script>
            function validation_information() {
                if ($("#city").val() == "") {
                    $('html, body').animate({scrollTop: $('#step-1').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please enter a valid City",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else if ($("#zip").val() == "") {
                    $('html, body').animate({scrollTop: $('#step-1').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please enter a valid zip code",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else if ($("#address").val() == "") {
                    $('html, body').animate({scrollTop: $('#step-1').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please enter a valid address",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else if ($("#state").val() == "") {
                    $('html, body').animate({scrollTop: $('#step-1').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please enter a valid state",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else if ($("#country").val() == "") {
                    $('html, body').animate({scrollTop: $('#step-1').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please enter a valid country",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else if ($("input[name='consent']:checked").val() != "on") {
                    $('html, body').animate({scrollTop: $('#consent').offset().top}, "slow");

                    swal({
                        title: "Sorry!",
                        text: "Please agree the Terms and Condition.",
                        icon: "warning",
                        button: "OK"
                    });
                    return false;
                } else {
                    return true;
                }
            }
        </script>

        <script>
            $("#CODbtn").click(function (e) {
                if (validation_information()) {
                    //save total price in input type and pass to servlet
                    document.querySelector('#basketTotal').setAttribute("value", document.querySelector('div.card-action span.store_basketTotal').textContent);
                    document.querySelector('#payment_method').setAttribute("value", "COD");
                    swal({
                        title: "Purchase Successfully!",
                        text: "Thank you for shopping us!!!",
                        icon: "success",
                        button: "OK"
                    }).then((value) => { // submit form
                        $("#paymentForm").submit();
                    });
                }

            });

            //Credit Card Payment
            $("#CCbtn").click(function (e) {
                var regName = /^[a-zA-Z]{1}[a-zA-Z ]*$/;
                var regCardNum = /^[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}$/;
                var regExpDate = /^[0-9]{2}\/[0-9]{2}$/;

                if (validation_information()) {
                    if ($("#cname").val() == "") {
                        swal({
                            title: "Sorry!",
                            text: "Name cannot be empty",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else if (!regName.test($('#cname').val())) {
                        swal({
                            title: "Sorry!",
                            text: "Please enter letter name",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else if ($("#ccnum").val() == "") {
                        swal({
                            title: "Sorry!",
                            text: "Card number cannot be empty",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else if (!regCardNum.test($('#ccnum').val())) {
                        swal({
                            title: "Sorry!",
                            text: "Invalid Card Number. Please follow the format XXXX-XXXX-XXXX-XXXX",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else if (!regExpDate.test($('#expdate').val())) {
                        swal({
                            title: "Sorry!",
                            text: "Invalid Exp Date. Please follow the format mm/yy",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else if ($('#cvv').val() == "") {
                        swal({
                            title: "Sorry!",
                            text: "Invalid CVV. Please try again",
                            icon: "warning",
                            button: "OK"
                        });
                        return false;
                    } else {
                        document.querySelector('#basketTotal').setAttribute("value", document.querySelector('div.card-action span.store_basketTotal').textContent);
                        document.querySelector('#payment_method').setAttribute("value", "Credit Card");
                        document.querySelector('#credit_card_name').setAttribute("value", $("#cname").val());
                        document.querySelector('#credit_card_number').setAttribute("value", $("#ccnum").val());
                        document.querySelector('#credit_card_expDate').setAttribute("value", $("#expdate").val());
                        document.querySelector('#credit_card_cvv').setAttribute("value", $('#cvv').val());
                        swal({
                            title: "Purchase Successfully!",
                            text: "Thank you for shopping us!!!",
                            icon: "success",
                            button: "OK"
                        }).then((value) => {
                            $("#paymentForm").submit();
                        });

                    }
                }
            });
        </script>
    </body>

</html>
