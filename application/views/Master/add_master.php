<div class="collapse" id="mastercollapseExample">
	<form class="well" name="adsourceform" autocomplete="off" role="form" novalidate>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row form-group">
					<div class="col-sm-2">
						<label for="slblname" style="margin-top:8px;"> Name : &nbsp; <span style="color:red;">*</span></label>
					</div>
					<div class="col-sm-6" ng-class="{ 'has-error' :adsourceform.schSource.$invalid && !adsourceform.schSource.$pristine }">
						<input type="text" id="schSource" name="schSource" ng-model="schSource" placeholder="Name" onClick="rmeror('miniadderror');" title="Enter {{pagetitle}}" class="form-control" ng-change="verifyduplicatemini(adsourceform)" ng-minlength="1" required>
					</div>
					<div class="col-sm-4" style="color:red;">
						<small ng-show="adsourceform.schSource.$error.minlength">Too short Name.</small>
						<small style="color:red;" id="miniadderror"></small>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-2">
						<label for="slblact" style="margin-top:8px;"> Is Active? : </label>
					</div>
					<div class="col-sm-4">
						<div class="onoffswitch">
							<input type="checkbox" ng-model="srcactive" ng-false-value="'0'" ng-checked="true" ng-true-value="'1'" class="onoffswitch-checkbox" id="myonoffswitch" checked>
							<label class="onoffswitch-label" for="myonoffswitch">
								<span class="onoffswitch-inner"></span>
								<span class="onoffswitch-switch"></span>
							</label>
						</div>

					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-5"></div>
					<div class="col-sm-4">
						<button type="submit" class="btn" id="addsubmitbtn">Save</button>
						<button type="button" ng-click="resetminiform()" class="btn" id="reset">Reset</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>