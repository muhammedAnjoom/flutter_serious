import 'package:copy_ui/model/home_model.dart';

class Data {
  List<HomeModel> homeList = [
    HomeModel(
      image:
          "https://www.pngitem.com/pimgs/m/2-25457_speaker-icon-circle-hd-png-download.png",
      title: "Marketing\nDesigns",
      visible: false,
    ),
    HomeModel(
      image:
          "https://static.vecteezy.com/system/resources/previews/017/785/212/original/money-icon-on-transparent-background-free-png.png",
      title: "Online\nPayments",
      visible: false,
    ),
    HomeModel(
      image:
          "https://w7.pngwing.com/pngs/373/707/png-transparent-discounts-and-allowances-dental-discount-plan-shopping-promotion-flat-icon-miscellaneous-service-area.png",
      title: "Discount\nCoupons",
      visible: false,
    ),
    HomeModel(
      image:
          "https://img.freepik.com/premium-vector/customer-service-icon-vector-full-customer-care-service-hand-with-persons-vector-illustration_399089-2810.jpg",
      title: "My\nCustomers",
      visible: false,
    ),
    HomeModel(
      image:
          "https://media.istockphoto.com/id/1358621997/vector/qr-code-smartphone-scanner-linear-icon-vector-illustration.jpg?s=612x612&w=0&k=20&c=ePiWZHIbseW9GwmM498rRKC_Dvk8IsKv41nqnC8iZhQ=",
      title: "Store QR\nCode",
      visible: false,
    ),
    HomeModel(
      image:
          "https://cdn.icon-icons.com/icons2/1585/PNG/512/3709729-charge-extra-money-online-service_108086.png",
      title: "Extra\nCharges",
      visible: false,
    ),
    HomeModel(
      image:
          "https://static.vecteezy.com/system/resources/previews/002/555/448/original/clicking-cart-order-shopping-or-payment-mobile-banking-line-style-icon-free-vector.jpg",
      title: "Order\nForm",
      visible: true,
    ),
  ];
  List<ProductModel> productList = [
    ProductModel(
      name: "Couch Potato | Women",
      price: "799",
      image:
          "https://ih1.redbubble.net/image.1211233096.0441/ssrco,tote,cotton,canvas_creme,flatlay,tall_portrait,750x1000-bg,f8f8f8.1.jpg",
    ),
    ProductModel(
      name: "Couch Potato | Men",
      price: "799",
      image:
          "https://static01.nyt.com/images/2019/07/22/fashion/mens-style/oakImage-1563825084859/oakImage-1563825084859-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
    ),
    ProductModel(
      name: "Muge | Explore",
      price: "399",
      image:
          "https://m.media-amazon.com/images/I/61p5QpMrL7L._AC_UF894,1000_QL80_.jpg",
    ),
    ProductModel(
      name: "Combo Sticker",
      price: "699",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7bmo5Q7ITdcx2ITWi4LeBcwr7dQuhJWjJXQ&usqp=CAU",
    ),
    ProductModel(
      name: "Muge | Anime",
      price: "449",
      image: "https://m.media-amazon.com/images/I/71BPAvD4WtL.jpg",
    ),
    ProductModel(
      name: "Shose | Nike",
      price: "2999",
      image:
          "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e9d41cd4-a2c5-4ca7-a3aa-f4bf597658d0/custom-nike-air-force-1-mid-by-you-shoes.png",
    ),
    ProductModel(
      name: "Baggy Jeans | Men",
      price: "1299",
      image:
          "https://images-cdn.ubuy.co.in/643010935dd84355bf2cfe97-men-s-baggy-jeans-2023-new-fashion-black.jpg",
    ),
  ];
  List<PayoutsModel> payoutList = [
    PayoutsModel(
      orderId: "1688068",
      dateTime: "jul 12 02:06 PM",
      image: "https://m.media-amazon.com/images/I/61TRpLYp5FL._AC_UY1100_.jpg",
      price: "799",
    ),
    PayoutsModel(
      orderId: "1457741",
      dateTime: "Apr 26 07:47 AM",
      image:
          "https://m.media-amazon.com/images/I/71HfC5uoJvL._AC_UF894,1000_QL80_.jpg",
      price: "899",
    ),
    PayoutsModel(
      orderId: "1688068",
      dateTime: "jul 12 02:06 PM",
      image: "https://m.media-amazon.com/images/I/61TRpLYp5FL._AC_UY1100_.jpg",
      price: "397.4",
    ),
    PayoutsModel(
      orderId: "1369633",
      dateTime: "Apr 11 10:54 AM",
      image:
          "https://ih1.redbubble.net/image.1211233096.0441/ssrco,tote,cotton,canvas_creme,flatlay,tall_portrait,750x1000-bg,f8f8f8.1.jpg",
      price: "686.42",
    ),
    PayoutsModel(
      orderId: "136933",
      dateTime: "Apr 2 11:26 AM",
      image:
          "https://static01.nyt.com/images/2019/07/22/fashion/mens-style/oakImage-1563825084859/oakImage-1563825084859-articleLarge.jpg?quality=75&auto=webp&disable=upscale",
      price: "1123.5",
    ),
    PayoutsModel(
      orderId: "1370125",
      dateTime: "Apr 1 11:19 AM",
      image: "https://m.media-amazon.com/images/I/71nksBceTiL._AC_UY1100_.jpg",
      price: "1722.75",
    ),
    PayoutsModel(
      orderId: "1370568",
      dateTime: "Apr 1 10:37 AM",
      image: "https://m.media-amazon.com/images/I/81P97Vm0SaL._AC_UY1000_.jpg",
      price: "599.25",
    ),
    PayoutsModel(
      orderId: "1359971",
      dateTime: "Apr 1 09:46 AM",
      image:
          "https://5.imimg.com/data5/PH/DU/PU/SELLER-33761974/omabasics-sky-blue-500x500.jpg",
      price: "884.17",
    ),
    PayoutsModel(
      orderId: "12651053",
      dateTime: "Mar 6 01:26 PM",
      image:
          "https://i.etsystatic.com/12726817/r/il/9cf2a6/1009293639/il_570xN.1009293639_h4w0.jpg",
      price: "2,297",
    ),
    PayoutsModel(
      orderId: "1173537",
      dateTime: "Feb 22 10:04 PM",
      image:
          "https://5.imimg.com/data5/SELLER/Default/2023/2/PW/YM/ZH/4903032/5-500x500.jpg",
      price: "599.25",
    ),
    PayoutsModel(
      orderId: "1174245",
      dateTime: "Feb 21 01:25 PM",
      image:
          "https://www.t10sports.com/wp-content/uploads/2023/06/MEN-T-SHIRT-FRONT-scaled.jpg",
      price: "524.25",
    ),
    PayoutsModel(
      orderId: "1174245",
      dateTime: "Feb 21 10:20 AM",
      image: "https://img.fruugo.com/product/4/39/147028394_max.jpg",
      price: "699",
    ),
    PayoutsModel(
      orderId: "1177731",
      dateTime: "Feb 20 09:54 AM",
      image:
          "https://cdn.shopaccino.com/feranoid/products/goku-sun-white-t-shirt-114777_m.jpg?v=466",
      price: "1123.5",
    ),
    PayoutsModel(
      orderId: "1174282",
      dateTime: "Feb 19 10:47 AM",
      image: "https://img.fruugo.com/product/6/93/718780936_max.jpg",
      price: "799",
    ),
    PayoutsModel(
      orderId: "1174435",
      dateTime: "Feb 18 12:08 PM",
      image:
          "https://cdn.shopaccino.com/feranoid/products/blue-goku-t-shirt-407407_m.jpg?v=466",
      price: "524.25",
    ),
    PayoutsModel(
      orderId: "1164892",
      dateTime: "Feb 13 07:57 AM",
      image: "https://img.fruugo.com/product/1/25/733109251_max.jpg",
      price: "524.25",
    ),
  ];
  List<FeatureModel> FeatureListData = [
    
  ];
}
