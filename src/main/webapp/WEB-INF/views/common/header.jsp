<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Page header-->
        <header>
            <div class="carousel slide" id="carouselExampleIndicators" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="main_img carousel-inner">
                    <div class="carousel-item active">
                        <img class="list_main_img d-block w-100" src="<c:url value='/resources/assets/img/pet_yellow_champion_hood.jpg'/>" alt="..." />
<%--                         <img class="list_main_img d-block w-100" src="<c:url value='/resources/assets/img/1.jpg'/>" alt="..." /> --%>
                        <div class="carousel-caption d-none d-md-block">
                            <h3>댕댕몰</h3>
                            <p>댕댕이의, 댕댕이에 의한, 댕댕이를 위한</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="list_main_img d-block w-100" src="<c:url value='/resources/assets/img/pet_green_santa_hood.jpg'/>" alt="..." />
<%--                         <img class="d-block w-100" src="<c:url value='/resources/assets/img/pet_white_n_yellow_hood.jpg'/>" alt="..." /> --%>
<%--                         <img class="d-block w-100" src="<c:url value='/resources/assets/img/2.jpg'/>" alt="..." /> --%>
                        <div class="carousel-caption d-none d-md-block">
                            <h3>댕댕몰</h3>
                            <p>내 댕댕이를 위한 모든 것</p>
                        </div>
                    </div>
                    	<script src=""></script>
                   
                    <div class="carousel-item">
                        <img class="list_main_img d-block w-100" src="<c:url value='/resources/assets/img/pet_green_hood.jpg'/>" alt="..." />
<%--                         <img class="d-block w-100" src="<c:url value='/resources/assets/img/3.jpg'/>" alt="..." /> --%>
                        <div class="carousel-caption d-none d-md-block">
                            <h3>댕댕몰</h3>
                            <p>의류, 신발, 가방, 모든것을 한 공간에서 <!-- 내댕댕이를 패셔니스타로 --></p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>