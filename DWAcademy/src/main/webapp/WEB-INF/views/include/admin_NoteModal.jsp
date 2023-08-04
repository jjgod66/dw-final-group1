<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.new_note_alert {
	border-radius: 0.3rem;
    line-height: 1rem;
    font-size: 0.5rem;
    position: absolute;
    width: 1rem;
    height: 1rem;
    top: 40%;
    right: 1%;
    color: white;
    background-color: red;
	    display: none;
}
.noteDiv {
	display: none;
}
.my_received_notes {
	display: block;
}
.note_tab li {
	cursor: pointer;
}
.noteRow {
	cursor: pointer;
}
.deleteNoteBtn {
    position: absolute;
    display: none;
    top: 36%;
    right: 0.5rem;
    width: 1.2rem;
    height: 1.2rem;
    text-align: center;
    line-height: 1.2rem;
    color: white;
    background-color: black;
    border-radius: 0.3rem;
}
.prepageBtn .page-link:hover, .nextpageBtn .page-link:hover{
	background-color : #4aa8d8;
	color: white;
}
</style>

<div class="modal fade" id="note_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content" style="min-height: 547px;">
      <div class="modal-header" style="color: white; background-color: #4aa8d8;">
        <h1 class="modal-title fs-5" id="exampleModalLabel"><b>쪽지함</b></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="mt-2 mx-2">
        	<ul class="nav nav-tabs note_tab">
			  <li class="nav-item">
			    <a class="nav-link active" data-tap="tap_received">받은 쪽지함</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-tap="tap_sended">보낸 쪽지함</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-tap="tap_sending">쪽지 보내기</a>
			  </li>
			</ul>
        </div>
      <div class="modal-body">
        <div class="noteDiv my_received_notes">
      			<div class="card-body row mb-2" style="--bs-gutter-x: 0; padding: 0.3rem 0; width:100%; text-align: center; background-color: #e9ecef; border-radius: 0.5rem;">
      				<div class="col-md-6"><b class="ms-2">제목</b></div>
      				<div class="col-md-3"><b>보낸이</b></div>
      				<div class="col-md-3"><b>받은날짜</b></div>
      			</div>
        	<div id="noteRowList">
        		<div class="card mb-2 noteRow">
        		</div>
        	</div>
        	<div style="position: absolute; bottom: 8px; left: 45%;">
        		<nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item prepageBtn">
				      <a class="page-link" onclick="javascript:showReceivedTap(1);"> <b>&lt;</b> </a>
				    </li>
				    <li class="page-item nextpageBtn">
				      <a class="page-link" onclick="javascript:showReceivedTap(2);"> <b>&gt;</b> </a>
				    </li>
				  </ul>
				</nav>
        	</div>
        </div>
        <div class="noteDiv my_sended_notes">
        	<div class="card-body row mb-2" style="--bs-gutter-x: 0; padding: 0.3rem 0; width:100%; text-align: center; background-color: #e9ecef; border-radius: 0.5rem;">
      				<div class="col-md-6"><b class="ms-2">제목</b></div>
      				<div class="col-md-3"><b>받은이</b></div>
      				<div class="col-md-3"><b>보낸날짜</b></div>
      			</div>
        	<div id="noteRowList">
        		<div class="card mb-2 noteRow">
        	</div>
        	</div>
        	<div style="position: absolute; bottom: 8px; left: 45%;">
        		<nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item prepageBtn">
				      <a class="page-link" onclick="javascript:showSendedTap(1);"> <b>&lt;</b> </a>
				    </li>
				    <li class="page-item nextpageBtn">
				      <a class="page-link" onclick="javascript:showSendedTap(2);"> <b>&gt;</b> </a>
				    </li>
				  </ul>
				</nav>
        	</div>
        </div>
        <div class="noteDiv my_sending_notes">
        	<div class="sendNoteForm">
        		<form id="sendNoteForm">
        			<div class="mb-3 row">
        				<div class="col-md-8">
		        			<input type="text" class="form-control" id="write_note_title">
        				</div>
        				<div class="col-md-4">
        					<select id="selectThr" style="margin-top: 0.1rem; width: 100%; height: 90%; border-radius: 0.5rem;">
        					</select>
        				</div>
        			</div>
        			<div>
        				<textarea class="form-control" style="resize: none; height:20rem;" id="write_note_content"></textarea>
        			</div>
        		</form>
	        		<div class="text-end mt-3">
	        			<button type="button" class="btn btn-primary" id="sendNoteBtn">보내기</button>
	        		</div>
        	</div>
        </div>
        <div class="noteDiv note_detail">
        	<div>
        		<div class="mb-3 row">
       				<div class="col-md-8">
	        			<input type="text" class="form-control" id="read_note_title" value="" readonly>
       				</div>
       				<div class="col-md-2">
       					<input type="text" class="form-control" id="read_note_relator" value="" readonly>
       					<input type="hidden" class="form-control" id="read_note_relator_cd" value="">
       				</div>
       				<div class="col-md-2">
       					<input type="text" class="form-control" id="read_note_date" value="" style="height: 100%; font-size: 0.7rem;" readonly>
       				</div>
       			</div>
       			<div>
       				<textarea class="form-control" style="resize: none; height:20rem;" id="read_note_content" readonly></textarea>
       			</div>
       			<div class="text-end mt-3">
     				<input type="hidden" id="relativeType">
        			<button type="button" class="btn btn-primary" id="reSendBtn">답장하기</button>
        			<button type="button" class="btn btn-primary" id="noteListBtn">목록으로</button>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>