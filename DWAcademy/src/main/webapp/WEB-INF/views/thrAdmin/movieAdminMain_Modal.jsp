<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="background-color : #4aa8d8; color: white;">
        <h1 class="modal-title fs-5" id="exampleModalLabel">상영영화 상세정보</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-md-4">
        		<div class="modalImgDiv" style="height: 20rem; border: 1px solid #4aa8d8;">
        			<img src="" style="width:100%; height:100%;">
        		</div>
        	</div>
        	<div class="col-md-8">
        		<div class="p-3 modalScreenMapDiv" style="width: 100%; height: 100%; border: 1px solid #4aa8d8;">
        			<div class="text-center" style="height : 10%; background-color: black; color: white; vertical-align: middle;">SCREEN</div>
        			<div id="seatMapDiv" class="mt-3">
        				
        			</div>
        		</div>
        	</div>
        	<div class="col-md-12 mt-3">
        		<table class="table table-bordered text-center" style="vertical-align: middle;">
        			<tr>
        				<th>상영코드</th>
        				<td id="movieCd_modal"></td>
        				<th>영화명</th>
        				<td id="movieName_modal"></td>
        			</tr>
        			<tr>
        				<th>상영관</th>
        				<td id="houseName_modal"></td>
        				<th>예매수</th>
        				<td id="screenReservCnt_modal"></td>
        			</tr>
        			<tr>
        				<th>러닝타임</th>
        				<td id="movieLength_modal"></td>
        				<th>상영타입<br>(자막/3D유무)</th>
        				<td id="screenType_modal"></td>
        			</tr>
        			<tr>
        				<th>시작시간</th>
        				<td id="startTime_modal"></td>
        				<th>종료시간</th>
        				<td id="endTime_modal"></td>
        			</tr>
        		</table>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>