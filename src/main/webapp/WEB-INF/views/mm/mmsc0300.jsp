<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">원자재 재고현황(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="p-0" style="flex: 0 0 22%; max-width: 22%;">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="itemInfoAdmTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="p-0" style="flex: 0 0 18%; max-width: 18%;">
				<div class="row p-0" style="height:10vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table class="table table-bordered m-0">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>차종</th>
									<td id="itemModeLNm"></td>
									<th>재고수량</th>
									<td class="text-right" id="realQty"></td>
								</tr>
								<tr>
									<th>품번</th>
									<td colspan='3' id="spCd"></td>
								</tr>
								<tr>
									<th>품명</th>
									<td colspan='3' id="spNm"></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="row p-0 mb-2" style="height:26vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table id="locationToStockPaymentTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>구역</th>
									<th class="text-center">재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<div class="row p-0 mb-2" style="height:50vh;">
					<div class="col-md-12 ml-2 p-1" style="background-color:#ffffff;">
						<table id="locationToLotTable" class="table table-bordered m-0">
							<thead class="thead-light">
								<tr>
									<th>입고일자</th>
									<th>LOT NO</th>
									<th class="text-center">재고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="p-0" style="flex: 0 0 58%; max-width: 58%;">
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" style="height:4vh; background-color:#ffffff;">
						<div class="float-left mt-1" style="display: inline;">
							<button type="button" id="returnBtn" name="returnBtn" class="btn btn-primary float-right">전체 창고 보기</button>
						</div>
						<div class="float-right mt-1" style="display: inline;">
							<span class="mr-2">선입선출 순서</span>
							<span class="badge mr-2" style="background-color: #ed1c24; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #20b2aa; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #66ccff; width:50px; font-size: 0.725rem;">&nbsp;</span>
							<span class="oi oi-arrow-right mr-2"></span>
							<span class="badge mr-2" style="background-color: #0000ff; width:50px; font-size: 0.725rem;">&nbsp;</span>
						</div>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" id="locationList" style="height:62vh; background-color:#ffffff;">
					</div>
				</div>
				<!-- A,B구역  -->
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1 d-none" id="locationListAB" style="height:62vh; background-color:#ffffff;">
						<div class="container-fluid p-1" style="position: absolute; top:40px; left:70px; width:400px; height:500px; background-color:#ffc738;
						 		border-radius:10px; box-shadow: 2px 1px 10px #ffc738;">
						 	<div class="row" id="" style="height:23%; border: 0 solid #ffffff">
						 		<div class="col-md-3 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="9-1" id="A-9-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>9-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="10-1" id="A-10-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>10-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="11-1" id="A-11-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>11-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="12-1" id="A-12-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>12-1</span>
						 		</div>
						 	</div>
						 	<div class="row" id="" style="height:23%; border: 0 solid #ffffff">
						 		<div class="col-md-3 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="5-1" id="A-5-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>5-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="6-1" id="A-6-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>6-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="7-1" id="A-7-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>7-1</span>
						 		</div>
						 		<div class="col-md-3 ml-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="8-1" id="A-8-1" style="max-width:23%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>8-1</span>
						 		</div>
						 	</div>	
						 	<div class="row" id="" style="height:23%; border: 0 solid #ffffff">
						 		<div class="col-md-6 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="3-1" id="A-3-1" style="max-width:48%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-6 mr-0 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="4-1" id="A-4-1" style="max-width:49%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 	</div>
						 	<div class="row" id="" style="height:23%; border: 0 solid #ffffff">
						 		<div class="col-md-6 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="1-1" id="A-1-1" style="max-width:48%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-6 mr-0 mb-1 p-1 text-center boxFloor" data-area="A" data-floorcd="2-1" id="A-2-1" style="max-width:49%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 	</div>	
						 	<div class="row" style="height:35px;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">A구역</span></div>
						 </div>
						 <div class="container-fluid p-1" style="position: absolute; top:40px; left:510px; width:400px; height:500px; background-color:#ffc738;
						 		border-radius:10px; box-shadow: 2px 1px 10px #ffc738;">
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="13-1" id="B-13-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>13-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="15-1" id="B-15-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>15-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="17-1" id="B-17-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>17-1</span>
						 		</div>
						 	</div>
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="14-1" id="B-14-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>14-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="16-1" id="B-16-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>16-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="18-1" id="B-18-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>18-1</span>
						 		</div>
						 	</div>	
						 	<div style=" border: 1px solid #c2bebe; background: #c2bebe; padding: 3px;margin-bottom: 3px;"></div>
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="7-1" id="B-7-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>7-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="9-1" id="B-9-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>9-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="11-1" id="B-11-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>11-1</span>
						 		</div>
						 	</div>
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="8-1" id="B-8-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>8-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="10-1" id="B-10-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>10-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="12-1" id="B-12-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>12-1</span>
						 		</div>
						 	</div>
						 	<div style=" border: 1px solid #c2bebe; background: #c2bebe; padding: 3px;margin-bottom: 3px;"></div>
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="1-1" id="B-1-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="3-1" id="B-3-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="5-1" id="B-5-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>5-1</span>
						 		</div>
						 	</div>
						 	<div class="row" id="" style="height:14.5%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="2-1" id="B-2-1" style="max-width:31%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="4-1" id="B-4-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="B" data-floorcd="6-1" id="B-6-1" style="max-width:32%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>6-1</span>
						 		</div>
						 	</div>
						 	 <div class="row" style="height:35px;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">B구역</span></div>
						 </div>
						 <div class="m-1 mb-2 ml-2">
						</div>
					</div>
				</div>
				
				<!-- C구역  -->
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1 d-none" id="locationListC" style="height:62vh; background-color:#ffffff;">
						<div class="container-fluid p-1" style="position: absolute; top:15px; left:30px; width:930px; height:260px; background-color:#2fdd17;
						 		border-radius:30px; box-shadow: 2px 1px 10px #80b860;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="1-4" id="C-1-1-4" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="2-4" id="C-1-2-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="3-4" id="C-1-3-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-4</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="1-3" id="C-1-1-3" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="2-3" id="C-1-2-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="3-3" id="C-1-3-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-3</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="1-2" id="C-1-1-2" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="2-2" id="C-1-2-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="3-2" id="C-1-3-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="1-1" id="C-1-1-1" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="2-1" id="C-1-2-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-1" data-floorcd="3-1" id="C-1-3-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">C-1</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="1-4" id="C-2-1-4" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="2-4" id="C-2-2-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="3-4" id="C-2-3-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-4</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="1-3" id="C-2-1-3" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="2-3" id="C-2-2-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="3-3" id="C-2-3-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-3</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="1-2" id="C-2-1-2" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="2-2" id="C-2-2-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="3-2" id="C-2-3-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="1-1" id="C-2-1-1" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="2-1" id="C-2-2-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-2" data-floorcd="3-1" id="C-2-3-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">C-2</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="1-4" id="C-3-1-4" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="2-4" id="C-3-2-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-4</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="3-4" id="C-3-3-4" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-4</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="1-3" id="C-3-1-3" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="2-3" id="C-3-2-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-3</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="3-3" id="C-3-3-3" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-3</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="1-2" id="C-3-1-2" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="2-2" id="C-3-2-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="3-2" id="C-3-3-2" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="1-1" id="C-3-1-1" style="height: 50px; margin-left: 10px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="2-1" id="C-3-2-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-3" data-floorcd="3-1" id="C-3-3-1" style="height: 50px; max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">C-3</span></div>
						 	</div>
						 </div>
						<div class="container-fluid p-1" style="position: absolute; top:300px; left:30px; width:930px; height:260px; background-color:#2fdd17;
						 		border-radius:30px; box-shadow: 2px 1px 10px #80b860;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-4" data-floorcd="1-1" id="C-4-1-1" style="height: 210px; margin-left: 40px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-4" data-floorcd="2-1" id="C-4-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-4" data-floorcd="3-1" id="C-4-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">C-4</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-5" data-floorcd="1-1" id="C-5-1-1" style="height: 210px; margin-left: 40px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-5" data-floorcd="2-1" id="C-5-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-5" data-floorcd="3-1" id="C-5-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span> 
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">C-5</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="C-6" data-floorcd="1-1" id="C-6-1-1" style="height: 210px; margin-left: 40px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-6" data-floorcd="2-1" id="C-6-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="C-6" data-floorcd="3-1" id="C-6-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">C-6</span></div>
						 	</div>
						 </div>
					</div>
				</div>
				
				<!-- D구역  -->
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1 d-none" id="locationListD" style="height:62vh; background-color:#ffffff;">
						<div class="container-fluid p-1" style="position: absolute; top:15px; left:30px; width:930px; height:260px; background-color:#00b0f0;
						 		border-radius:30px; box-shadow: 2px 1px 10px #00b0f0;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="D-1" data-floorcd="1-1" id="D-1-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-1" data-floorcd="2-1" id="D-1-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-1" data-floorcd="3-1" id="D-1-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-1" data-floorcd="4-1" id="D-1-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">D-1</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-2" data-floorcd="1-1" id="D-2-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-2" data-floorcd="2-1" id="D-2-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-2" data-floorcd="3-1" id="D-2-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span> 
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-2" data-floorcd="4-1" id="D-2-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">D-2</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="D-3" data-floorcd="1-1" id="D-3-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-3" data-floorcd="2-1" id="D-3-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-3" data-floorcd="3-1" id="D-3-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-3" data-floorcd="4-1" id="D-3-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">D-3</span></div>
						 	</div>
						 </div>
						 <div class="container-fluid p-1" style="position: absolute; top:300px; left:30px; width:930px; height:260px; background-color:#00b0f0;
						 		border-radius:30px; box-shadow: 2px 1px 10px #00b0f0;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="D-4" data-floorcd="1-1" id="D-4-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-4" data-floorcd="2-1" id="D-4-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-4" data-floorcd="3-1" id="D-4-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-4" data-floorcd="4-1" id="D-4-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">D-4</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-5" data-floorcd="1-1" id="D-5-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-5" data-floorcd="2-1" id="D-5-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-5" data-floorcd="3-1" id="D-5-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span> 
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-5" data-floorcd="4-1" id="D-5-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">D-5</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="D-6" data-floorcd="1-1" id="D-6-1-1" style="height: 210px; margin-left: 40px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-6" data-floorcd="2-1" id="D-6-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="D-6" data-floorcd="3-1" id="D-6-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">D-6</span></div>
						 	</div>
						 </div>
					</div>
				</div>
				
				<!-- E구역  -->
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1 d-none" id="locationListE" style="height:62vh; background-color:#ffffff;">
						<div class="container-fluid p-1" style="position: absolute; top:15px; left:30px; width:930px; height:260px; background-color:#ffccff;
						 		border-radius:30px; box-shadow: 2px 1px 10px #ffccff;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="1-2" id="E-1-1-2" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="2-2" id="E-1-2-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="3-2" id="E-1-3-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="4-2" id="E-1-4-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-2</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="1-1" id="E-1-1-1" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="2-1" id="E-1-2-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="3-1" id="E-1-3-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-1" data-floorcd="4-1" id="E-1-4-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">E-1</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="1-2" id="E-2-1-2" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="2-2" id="E-2-2-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="3-2" id="E-2-3-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="4-2" id="E-2-4-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-2</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="1-1" id="E-2-1-1" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="2-1" id="E-2-2-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="3-1" id="E-2-3-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-2" data-floorcd="4-1" id="E-2-4-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">E-2</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="1-2" id="E-3-1-2" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="2-2" id="E-3-2-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="3-2" id="E-3-3-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-2</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="4-2" id="E-3-4-2" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-2</span>
						 		</div>
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="1-1" id="E-3-1-1" style="height: 100px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="2-1" id="E-3-2-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="3-1" id="E-3-3-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-3" data-floorcd="4-1" id="E-3-4-1" style="height: 100px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">E-3</span></div>
						 	</div>
						 </div>
						 <div class="container-fluid p-1" style="position: absolute; top:300px; left:30px; width:930px; height:260px; background-color:#ffccff;
						 		border-radius:30px; box-shadow: 2px 1px 10px #ffccff;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-4" data-floorcd="1-1" id="E-4-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-4" data-floorcd="2-1" id="E-4-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-4" data-floorcd="3-1" id="E-4-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-4" data-floorcd="4-1" id="E-4-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">E-4</span></div>
						 	</div>
						 	<div class="row mt-1" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-5" data-floorcd="1-1" id="E-5-1-1" style="height: 210px; margin-left: 23px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-5" data-floorcd="2-1" id="E-5-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-5" data-floorcd="3-1" id="E-5-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span> 
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-5" data-floorcd="4-1" id="E-5-4-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="text-center w-100" style="font-size:20px; font-weight: 900;">E-5</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 210px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4  mr-1 mb-1 p-1 text-center boxFloor" data-area="E-6" data-floorcd="1-1" id="E-6-1-1" style="height: 210px; margin-left: 40px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-6" data-floorcd="2-1" id="E-6-2-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 ml-3 mr-1 mb-1 p-1 text-center boxFloor" data-area="E-6" data-floorcd="3-1" id="E-6-3-1" style="height: 210px; max-width:20%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">E-6</span></div>
						 	</div>
						 </div>
					</div>
				</div>
				<!-- F구역  -->
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1 d-none" id="locationListF" style="height:62vh; background-color:#ffffff;">
						<div class="p-1" style="position: absolute; top:15px; left:10px; width:950px; height:150px; background-color:#ccccff;
						 		border-radius:30px; box-shadow: 2px 1px 10px #ccccff;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-1" data-floorcd="1-1" id="F-1-1-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-1" data-floorcd="2-1" id="F-1-2-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-1" data-floorcd="3-1" id="F-1-3-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-1</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 108px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-2" data-floorcd="1-1" id="F-2-1-1" style="margin-left: 33px;margin-right: 25px;height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-6 p-1 text-center boxFloor" data-area="F-2" data-floorcd="2-1" id="F-2-2-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-2</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 108px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-3" data-floorcd="1-1" id="F-3-1-1" style="margin-left: 33px;margin-right: 25px;height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-3" data-floorcd="2-1" id="F-3-2-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-3</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 108px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-4 ml-2 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-4" data-floorcd="1-1" id="F-4-1-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-4" data-floorcd="2-1" id="F-4-2-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-4" data-floorcd="3-1" id="F-4-3-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-4</span></div>
						 	</div>
						</div>
						<div class="p-1" style="position: absolute; top:178px;  left:10px; width:950px; height:150px; background-color:#ccccff;
						 		border-radius:30px; box-shadow: 2px 1px 10px #ccccff;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-5" data-floorcd="1-1" id="F-5-1-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-5" data-floorcd="2-1" id="F-5-2-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-5" data-floorcd="3-1" id="F-5-3-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-5</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 110px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-4 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-6" data-floorcd="1-1" id="F-6-1-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-6" data-floorcd="2-1" id="F-6-2-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-4 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-6" data-floorcd="3-1" id="F-6-3-1" style="height:100px;max-width: 30%;background-color: #ffffff;border-radius: 10px;overflow:hidden;font-size:15px;border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-6</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 110px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-7" data-floorcd="1-1" id="F-7-1-1" style="margin-left: 33px;margin-right: 25px;height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-7" data-floorcd="2-1" id="F-7-2-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-7</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 110px;"></div>
						 	<div class="row mt-2" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-8" data-floorcd="1-1" id="F-8-1-1" style="margin-left: 33px;margin-right: 25px;height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-6 mb-1 p-1 text-center boxFloor" data-area="F-8" data-floorcd="2-1" id="F-8-2-1" style="height:100px;max-width:30%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-8</span></div>
						 	</div>
						 </div>
						<div class="container-fluid p-1" style="position: absolute; top:342px;  left:10px; width:950px; height:223px; background-color:#ccccff;
						 		border-radius:30px; box-shadow: 2px 1px 10px #ccccff;display: grid; grid-template-columns: 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr 0.005fr 1fr;">
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-9" data-floorcd="1-1" id="F-9-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-9" data-floorcd="2-1" id="F-9-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-9" data-floorcd="3-1" id="F-9-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-9" data-floorcd="4-1" id="F-9-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-9</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-10" data-floorcd="1-1" id="F-10-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-10" data-floorcd="2-1" id="F-10-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-10" data-floorcd="3-1" id="F-10-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-10" data-floorcd="4-1" id="F-10-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-10</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-11" data-floorcd="1-1" id="F-11-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-11" data-floorcd="2-1" id="F-11-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-11" data-floorcd="3-1" id="F-11-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-11" data-floorcd="4-1" id="F-11-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-11</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #ffffff">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-12" data-floorcd="1-1" id="F-12-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-12" data-floorcd="2-1" id="F-12-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-12" data-floorcd="3-1" id="F-12-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-12" data-floorcd="4-1" id="F-12-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-12</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-13" data-floorcd="1-1" id="F-13-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-13" data-floorcd="2-1" id="F-13-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-13" data-floorcd="3-1" id="F-13-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-13" data-floorcd="4-1" id="F-13-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-13</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-14" data-floorcd="1-1" id="F-14-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-14" data-floorcd="2-1" id="F-14-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-14" data-floorcd="3-1" id="F-14-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-14" data-floorcd="4-1" id="F-14-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-14</span></div>
						 	</div>
						 	<div class="row" id="" style="height:100%;border: 1px solid #c2bebe;background: #c2bebe;padding: 3px;margin-bottom: 3px; height: 175px;"></div>
						 	<div class="row mt-1" id="" style="height:100%; border: 0 solid #00b0f0">
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-15" data-floorcd="1-1" id="F-15-1-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>1-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-15" data-floorcd="2-1" id="F-15-2-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>2-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-15" data-floorcd="3-1" id="F-15-3-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>3-1</span>
						 		</div>
						 		<div class="col-md-11 ml-1 mr-1 mb-1 p-1 text-center boxFloor" data-area="F-15" data-floorcd="4-1" id="F-15-4-1" style="max-width:100%; background-color: #ffffff; border-radius: 10px; overflow:hidden; font-size:15px; border: 1px solid #cccccc">
						 			<span>4-1</span>
						 		</div>
						 		<div class="row" style="height:30px;min-width: 100%;text-align: center;"><span class="w-100" style="font-size:20px; font-weight: 900;">F-15</span></div>
						 	</div>
						 </div>
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-md-12 ml-3 p-1" style="height:20vh; background-color:#ffffff;">
						<div class="row">
							<div class="col-md-5">
								<div style="display: inline-flex;">
									<label class="input-label-lg">구역</label>
									<input class="form-control-lg" type="text" id="locationCd" readonly>
								</div>
							</div>
							<div class="col-md-7">
								<table id="floorToStockPaymentTable" class="table table-bordered m-0">
									<thead class="thead-light">
										<tr>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th class="text-center">재고수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<script>
	let currentHref = "mmsc0300";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "원자재 재고현황(봉제)");

	let tmMon = moment().format('YYYY-MM');
	let tmDate = moment().format('YYYY-MM-DD');
	let startDateVal = moment().subtract('1','y').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemGubunVal = "001";
	
	let spCdVal = '';
	let locationNoVal = '';
	let areaCdNmVal = '';
	let floorCdVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);
	
	// 원자재 목록조회
	let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "79.3vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmList"/>',
			type : 'GET',
			data : {
				'tmMon' : function() {return tmMon.substring(0,7).replace(/-/g, '');},
				'tmDate' : function() {return tmDate.replace(/-/g, '');},
				'mainGubun' : function() {return "002"},
				'locationCd'	:	'006',
				'realQtyOption' : function() {return "Y";},
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'spCd', className : 'text-center' },
			{ data : 'spNm', className : 'text-center' },
			{ data : 'realQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});

	//품목 선택
	$('#itemInfoAdmTable tbody').on('click','tr',function() {
		let data = itemInfoAdmTable.row(this).data();
		spCdVal = data.itemSeq;
		$('.boxFloor').css('background-color','#ffffff').css('color','#000000');

		$('#itemModeLNm').text(data.itemModelNm);
		$('#realQty').text(addCommas(parseFloat(data.realQty)));
		$('#spCd').text(data.spCd);
		$('#spNm').text(data.spNm);
		
		$.ajax({
			url: '<c:url value="tm/locationDateToStockPayment"/>',
			type : 'POST',
			async: false,
			data : {
				'locationCd'	:	'006',
				'spCd'			:	function(){ return spCdVal; },
				'tmDate' : function(){ return tmMon.replace(/-/g, ''); },
			},
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let data = res.data;
				let tmGroupList = []; // 구역별 재고현황
				let count = 0;
				
				for(var i=0;i<data.length;i++) {

					if(count==0) { // 선입선출 1번째
						data[i].type = '001';
						tmGroupList.push(data[i]);
					} else if(count==1) { // 선입선출 2번째
						data[i].type = '002';
						tmGroupList.push(data[i]);
					} else if(count==2) { // 선입선출 3번째
						data[i].type = '003';
						tmGroupList.push(data[i]);
					} else if(count==3) { // 선입선출 4번째
						data[i].type = '004';
						tmGroupList.push(data[i]);
					} else { // 그밖의 모든 항목
						data[i].type = '005';
						tmGroupList.push(data[i]);
					}

					if(i+1<data.length){
						if(data[i].spDate!=data[(i+1)].spDate){
							count++;
						}
					}
					
				}

				console.log("tmGroupList[0]:"+tmGroupList[0].type)
				console.log("tmGroupList.sort():"+tmGroupList.sort())
				
				
				tmGroupList.sort((a,b) => parseInt(b.type) - parseInt(a.type));
				boxFloorBlink(tmGroupList);
				$('#my-spinner').hide();
			}
		});
		locationToStockPaymentTable.ajax.reload(function(){});
		locationToLotTable.clear().draw();
	});

	// 원자재 창고별 현재고 목록조회
	let locationToStockPaymentTable = $('#locationToStockPaymentTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "20vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmAreaList"/>',
			type : 'GET',
			data : {
				'tmMon' 		: function() {return tmMon.substring(0,7).replace(/-/g, '');},
				'mainGubun' 	: function() {return "002"},
				'locationCd'	:	'006',
				'realQtyOption' : function() {return "Y";},
				'itemSeq'		:	function(){ return spCdVal; }
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ 
				className : 'text-center',
				render : function(data, type, row, meta) {
					if(row['areaNm']!=null){
						return row['areaNm']+'/'+row['floorNm'];
					}else{
						return '';
					}
				}
			},
			{ data : 'realQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});

	// 원자재 창고별 현재고 선택
	$('#locationToStockPaymentTable tbody').on('click','tr',function() {
		let data = locationToStockPaymentTable.row(this).data();
		locationNoVal = data.locationNo;
		locationToLotTable.ajax.reload(function(){});

		boxAreaView(data.areaNm==null?"":data.areaNm);
		
	});

	// 창고별 LOT 목록조회
	let locationToLotTable = $('#locationToLotTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "40vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/locationToLot"/>',
			type : 'POST',
			data : {
				'locationCd'	:	'006',
				'spCd'			:	function(){ return spCdVal; },
				'locationNo'	:	function(){ return locationNoVal }
			},
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		columns : [
			{ data : 'spDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY/MM/DD');
				}
			},
			{ data : 'barcodeNo', className : 'text-center'},
			{ data : 'spQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : []
	});
	
	// 위치별 품목 재고 목록조회
	let floorToStockPaymentTable = $('#floorToStockPaymentTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching: false,
		pageLength : 100000000, 
		scrollY: "20vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="tm/floorToStockPayment"/>',
			type : 'POST',
			data : {
				'locationCd'	:	'006',
				'areaCdNm'		:	function(){return areaCdNmVal;},
            	'floorCd'		:	function(){return floorCdVal;}
			},
		},
		columns : [
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'itemCd', className : 'text-center' },
			{ data : 'itemNm', className : 'text-center' },
			{ data : 'sumQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			}
		],
		columnDefs : [],
		buttons : [],
		order : []
	});
	

	//박스 생성
	function makeBox(id, x, y, width, height, data) {
		let backgroundColor = ""; // 상자 배경색
		if(data.type == 'A') {
			backgroundColor = '#ffc738';
		} else if(data.type == 'B') {
			backgroundColor = '#ffc738';
		} else if(data.type == 'C') {
			backgroundColor = '#2fdd17';
		} else if(data.type == 'D') {
			backgroundColor = '#00b0f0';
		} else if(data.type == 'E') {
			backgroundColor = '#ffccff';
		} else if(data.type == 'F') {
			backgroundColor = '#ccccff';
		} else {
			backgroundColor = '#000000';
		}

		let areaLength = data.areaList;
		let areaStartNo = data.areaStartNo;

		for(var i=0; i<areaLength; i++){
			let html = '';
				html += '<div class="p-1 boxArea" style="text-align:center;position: absolute; top:'+y+'px; left:'+x+'px;';
				html += 'width:'+width+'px; height:'+height+'px; background-color:'+backgroundColor+';';
				
				if(data.type=='A'||data.type=='B'){
					html += 'border-radius: 10px; box-shadow: 2px 1px 10px '+backgroundColor+'; " data-area="'+data.type+'">';
					html += '	<span class="text-center w-100" style="font-size:20px;font-weight: 900;">'+data.title+'</span>';
				}else{
					html += 'border-radius: 10px; box-shadow: 2px 1px 10px '+backgroundColor+'; " data-area="'+data.type+'-'+areaStartNo+'">';
					html += '	<span class="text-center w-100" style="font-size:20px;font-weight: 900; line-height: 72px;">'+data.type+'-'+areaStartNo+'</span>';
				}
				html += '	</div>';
			$('#locationList').append(html);

			x += parseInt(data.left);
			areaStartNo ++;
		}
	
	}

	//화살표 생성
	function makeArrow(x, y, width, height, data) {
		let html = '';
			
		if(data.direction == 'up') {
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; width:0px; height:0px;'; //삼각형 그리기
			html += '													border-left: '+width/2+'px solid transparent;';
			html += '													border-right: '+width/2+'px solid transparent;';
			html += '													border-bottom: '+height/3+'px solid #2196f3;';
			html += '													border-radius: 5px;">';
			html += '</div>';
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)+parseInt(height)/3)+'px; left:'+(parseInt(x)+parseInt(width)/4)+'px; background-color: #2196f3;';
			html += '													width:'+width/2+'px; height:'+height/3*2+'px; border-radius: 0 0 5px 5px;">'; //사각형 그리기
			html += '	<div class="row align-items-center" style="color:#ffffff; height:100%">';
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*7/20+'px; font-weight:700;">'+data.title.split("")[0]+'</div>';
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*7/20+'px; font-weight:700;">'+data.title.split("")[1]+'</div>';
			html += '	</div>';
			html += '</div>';
		} else if(data.direction == 'down') {
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; background-color: #2196f3;'; //사각형 그리기
			html += '													width:'+width/2+'px; height:'+height/3*2+'px; border-radius: 5px 5px 0 0;">';
			html += '	<div class="row align-items-center" style="color:#ffffff; height:100%">';
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*7/20+'px; font-weight:700;">'+data.title.split("")[0]+'</div>';
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+width*7/20+'px; font-weight:700;">'+data.title.split("")[1]+'</div>';
			html += '	</div>';
			html += '</div>';
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)+parseInt(height)/3*2)+'px; left:'+(parseInt(x)-parseInt(width)/4)+'px; width:0px; height:0px;';
			html += '													border-top: '+height/3+'px solid #707276;'; //삼각형 그리기
			html += '													border-left: '+width/2+'px solid transparent;';
			html += '													border-right: '+width/2+'px solid transparent;';
			html += '													border-radius: 5px;">';
			html += '</div>';
		} else if(data.direction == 'left') { 
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; width:0px; height:0px;';
			html += '														border-top: '+height/2+'px solid transparent;';
			html += '														border-right: '+width/3+'px solid #2196f3;';
			html += ' 														border-bottom: '+height/2+'px solid transparent;';
			html += '														border-radius: 5px;">';
			html += '</div>';
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)+parseInt(height)/4)+'px; left:'+(parseInt(x)+parseInt(width)/4)+'px; background-color: #2196f3;';
			html += '													width:'+width/3*2+'px; height:'+height/2+'px; border-radius: 5px 5px 0 0;">';
			html += ' 	<div class"row align-items-center" style="color:#ffffff; width:100%">'
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+height*3/10+'px; font-weight:700;">'+data.title;
			html += '		</div>';
			html += ' 	</div>';	
			html += '</div>'													
		} else if(data.direction == 'right') {
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; background-color:#2196f3;';
			html += '													width:'+width/3*2+'px; height:'+height/2+'px; border-radius: 5px 5px 0 0;">';
			html += ' 	<div class"row align-items-center" style="color:#ffffff; width:100%">'
			html += '		<div class="col-md-12 p-0 text-center" style="color:#ffffff; font-size:'+height*3/10+'px; font-weight:700;">'+data.title;
			html += '		</div>';
			html += ' 	</div>';	
			html += '</div>'	
			html += '<div class="container-fluid p-0" style="position: absolute; top:'+(parseInt(y)-parseInt(height)/4)+'px; left:'+(parseInt(x)+parseInt(width)/5*3)+'px; width:0px; height:0px;';
			html += '														border-top: '+height/2+'px solid transparent;';
			html += '														border-left: '+width/3+'px solid #2196f3;';
			html += ' 														border-bottom: '+height/2+'px solid transparent;';
			html += '														border-radius: 5px;">';
			html += '</div>';
		}														
		$('#locationList').append(html);
	}

	//구역구분 생성
	function makeGubun(x, y, width, height, data) {
		let backgroundColor = ""; // 상자 배경색
		if(data.type == 'A') {
			backgroundColor = '#80b860';
		} else if(data.type == 'B') {
			backgroundColor = '#5c81cb';
		} else if(data.type == 'C') {
			backgroundColor = '#ffc738';
		} else if(data.type == 'D') {
			backgroundColor = '#0192ff';
		} else if(data.type == 'E') {
			backgroundColor = '#f37925';
		} else if(data.type == 'F') {
			backgroundColor = '#ccccff';
		} else {
			backgroundColor = '#000000';
		}
		
		let html = '';
			html += '<div class="container-fluid p-1" style="position: absolute; top:'+y+'px; left:'+x+'px;';
			html += '													width:'+width+'px; height:'+height+'px; background-color:'+backgroundColor+';';
			html += '													border-radius: 10px; box-shadow: 2px 1px 10px '+backgroundColor+'; ">';
			html += '	<div class="row p-0" >';
		if(data.type == 'X') { // 구역구분일 경우
			html += '		<div class="col-md-12 p-0 text-center" ><span class="text-center w-100" style="font-size:15px; font-weight: 900; color: #ffffff;">'+data.name+'</span></div>';
		} else {
			html += '		<div class="col-md-3 p-0 text-center border-dark border-right" ><span class="text-center w-100" style="font-size:15px; font-weight: 900;">'+data.title+'</span></div>';
			html += '		<div class="col-md-9 p-0 text-center" ><span class="text-center w-100" style="font-size:15px; font-weight: 900;">'+data.name+'</span></div>';
		}
			html += '	</div>';
			html += '</div>';
		$('#locationList').append(html);
	}

	//선 그리기
	function makeLine(x, y, width, height, data) {
		let html = '';
			
		if(data.lineDirection == 'vert') { // 가로줄
			html += '<hr class="container-fluid p-0" style="position: absolute; top:'+y+'px; left:'+x+'px; background-color: transparent;';
			html += '													width:'+width+'px; height:0px; color: #ffffff;';
			html += '													border: none; border-top: '+height+'px '+data.lineType+' '+data.lineColor+'; ">';
			if(data.prefix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-top: '+height*3/2+'px solid transparent;';
				html += '													border-right: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-bottom: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
			if(data.surfix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x+width)+'px; width:0px; height:0px;';
				html += '													border-top: '+height*3/2+'px solid transparent;';
				html += '													border-left: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-bottom: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
		} else if(data.lineDirection == 'hori') { // 세로줄
			html += '<hr class="container-fluid p-0" style="position: absolute; top:'+(y+(width/2))+'px; left:'+(x-(width/2))+'px; background-color: transparent;';
			html += '													width:'+width+'px; height:0px; color: #ffffff; transform: rotate(90deg); ';
			html += '													border: none; border-top: '+height+'px '+data.lineType+' '+data.lineColor+'; ">';
			if(data.prefix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-left: '+height*3/2+'px solid transparent;';
				html += '													border-bottom: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-right: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
			if(data.surfix) {
				html += '<div class="container-fluid p-0" style="position: absolute; top:'+(y+(width)+(height*3/2)+(height*2))+'px; left:'+(x-(height*3/2))+'px; width:0px; height:0px;';
				html += '													border-left: '+height*3/2+'px solid transparent;';
				html += '													border-top: '+height*2+'px solid '+data.lineColor+';';
				html += '													border-right: '+height*3/2+'px solid transparent;">';
				html += '</div>';
			}
		}
		
		
		$('#locationList').append(html);
	}



	// 제목
	makeBox('A구역', 5, 10, 150, 45, {type: 'A', title:'A구역', areaList:'1',areaStartNo:'1', left:'160'});
	makeBox('B구역', 170, 10, 150, 45, {type: 'B', title:'B구역', areaList:'1',areaStartNo:'1', left:'160'});
	makeBox('C구역', 5, 120, 95, 80, {type: 'C', title:'C', areaList: '6',areaStartNo:'1', left:'110'});
	makeBox('D구역', 335, 210, 95, 80, {type: 'D', title: 'D', areaList: '6',areaStartNo:'1', left:'110'});
	makeBox('E구역', 335, 300, 95, 80, {type: 'E', title: 'E', areaList: '6',areaStartNo:'1', left:'110'});
	makeBox('F구역', 5, 390, 95, 80, {type: 'F', title: 'F', areaList: '3',areaStartNo:'1', left:'110'});
	makeBox('F구역', 445, 390, 95, 80, {type: 'F', title: 'F', areaList: '4',areaStartNo:'4', left:'110'});
	makeBox('F구역', 5, 480, 95, 80, {type: 'F', title: 'F', areaList: '7',areaStartNo:'9', left:'110'});
	makeBox('F구역', 885, 480, 95, 80, {type: 'F', title: 'F', areaList: '1',areaStartNo:'8', left:'110'});
	 
	makeArrow(10, 90, 70, 20, {direction: 'left', title: ''});
	makeArrow(10, 70, 70, 20, {direction: 'right', title: ''});


	

	// 창고 표시
	function blinkBox(area, id, type) {
		console.log("area:"+area)
		if(area!=null){
			if(type == '001') {
				$('#'+id).css('background-color','#ed1c24').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
			} else if(type == '002') {
				$('#'+id).css('background-color','#20b2aa').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
			} else if(type == '003') {
				$('#'+id).css('background-color','#66ccff').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
			} else if(type == '004') {
				$('#'+id).css('background-color','#0000ff').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
			} else {
				//$('#'+id).css('background-color','#00ff00').css('color','#000000').css('animation','blink-effect 1s step-end infinite');
			}
		}

		$('#locationCd').val(area==null?"":area+"구역");
	}

	$(document).on('click', "#returnBtn",function() {
		$('#locationList').removeClass('d-none');
		$('#locationListAB').addClass('d-none');
		$('#locationListC').addClass('d-none');
		$('#locationListD').addClass('d-none');
		$('#locationListE').addClass('d-none');
		$('#locationListF').addClass('d-none');

		
	});

	function boxAreaView(area){
		console.log('dddddd:'+area)
		if(area.includes('A') || area.includes('B')){
			$('#locationList').addClass('d-none');
			$('#locationListAB').removeClass('d-none');
			$('#locationListC').addClass('d-none');
			$('#locationListD').addClass('d-none');
			$('#locationListE').addClass('d-none');
			$('#locationListF').addClass('d-none');
		}else if(area.includes('C')){
			$('#locationList').addClass('d-none');
			$('#locationListAB').addClass('d-none');
			$('#locationListC').removeClass('d-none');
			$('#locationListD').addClass('d-none');
			$('#locationListE').addClass('d-none');
			$('#locationListF').addClass('d-none');
		}else if(area.includes('D')){
			$('#locationList').addClass('d-none');
			$('#locationListAB').addClass('d-none');
			$('#locationListC').addClass('d-none');
			$('#locationListD').removeClass('d-none');
			$('#locationListE').addClass('d-none');
			$('#locationListF').addClass('d-none');
		}else if(area.includes('E')){
			$('#locationList').addClass('d-none');
			$('#locationListAB').addClass('d-none');
			$('#locationListC').addClass('d-none');
			$('#locationListD').addClass('d-none');
			$('#locationListE').removeClass('d-none');
			$('#locationListF').addClass('d-none');
		}else if(area.includes('F')){
			$('#locationList').addClass('d-none');
			$('#locationListAB').addClass('d-none');
			$('#locationListC').addClass('d-none');
			$('#locationListD').addClass('d-none');
			$('#locationListE').addClass('d-none');
			$('#locationListF').removeClass('d-none');
		}else {
			$('#locationList').removeClass('d-none');
			$('#locationListAB').addClass('d-none');
			$('#locationListC').addClass('d-none');
			$('#locationListD').addClass('d-none');
			$('#locationListE').addClass('d-none');
			$('#locationListF').addClass('d-none');
		}
	}
	
	// 위치 표시
	function boxFloorBlink(floorList) {

		console.log('dd');

		boxAreaView(floorList[0].areaNm==null?"":floorList[0].areaNm);
		
		for(var i=0;i<floorList.length;i++) {
			blinkBox(floorList[i].areaNm, floorList[i].areaNm+'-'+floorList[i].floorNm, floorList[i].type);
		}
	}

	 
	$(document).ready(function() {
		$('.boxArea').on('click',function() {
			
			let areaCd = $(this).attr('data-area');
			let floorCd = $(this).attr('data-floorcd');

			$('#locationCd').val(areaCd+(floorCd!=null?'/'+floorCd:"")+"구역");
			$('#locationList').addClass('d-none');

			if(areaCd.includes('A') || areaCd.includes('B')){
				$('#locationListAB').removeClass('d-none');
				selectNum='AB';
			}else if(areaCd.includes('C')){
				$('#locationListC').removeClass('d-none');
				selectNum='C';
			}else if(areaCd.includes('D')){
				$('#locationListD').removeClass('d-none');
				selectNum='D';
			}else if(areaCd.includes('E')){
				$('#locationListE').removeClass('d-none');
				selectNum='E';
			}else if(areaCd.includes('F')){
				$('#locationListF').removeClass('d-none');
				selectNum='F';
			}else{
				$('#locationListAB').removeClass('d-none');
				selectNum='AB';
			}
			

			areaCdNmVal = areaCd;
			floorCdVal = floorCd;
			floorToStockPaymentTable.ajax.reload(function(){});
		});


		$('.boxFloor').on('click',function() {

			areaCdNmVal = $(this).attr('data-area');
			floorCdVal = $(this).attr('data-floorcd');

			$('#locationCd').val(areaCdNmVal+(floorCdVal!=null?'/'+floorCdVal:"")+"구역");
			$('#locationList').addClass('d-none');
			
			floorToStockPaymentTable.ajax.reload(function(){});
		});
		
	});
</script>
</body>
</html>