--# selene: allow(unused_variable)
--# selene: allow(undefined_variable)
--# selene: allow(unscoped_variables)
--# selene: allow(global_usage)

-- [[ SERVERLIST.lua ]]
-- Decompiled with the Synapse X Luau decompiler.

local l__obtain__1 = _G.obtain;
local v2 = l__obtain__1("QBox");
local l__New__3 = v2.New;
local l__Avatar__4 = v2.Avatar;
local l__TextBox__5 = v2.TextBox;
local v6 = l__obtain__1("Tween");
local l__New__7 = v6.New;
local l__MaxAcceleration__8 = v6.MaxAcceleration;
local v9 = l__obtain__1("Local");
local v10 = l__obtain__1("Remote");
local v11 = l__obtain__1("Styles");
local l__Mode__12 = v11.Mode;
local l__Type__13 = v11.Type;
local v14 = l__obtain__1("Command");
local l__PlaceId__15 = game.PlaceId;
local l__userId__16 = l__obtain__1("PlayerManager").LocalPlayer.userId;
local l__TeleportService__17 = game:GetService("TeleportService");
local l__Color__1 = v2.Color;
local l__Call__2 = v10.Call;
local u3 = game.PlaceId;
local v18 = l__New__3();
v18.Visible = false;
v18.BackgroundColor = l__Color__1(37.5, 37.5, 37.5, 255);
v18.SizeOffsetX = 450;
v18.SizeOffsetY = 600;
v18.PosScaleX = 0.5;
function v18.Resize()
	v18.PosOffsetX = v18.SizeX / -2;
end;
local v19 = l__New__7(-v18.SizeY, function(p1)
	v18.PosOffsetY = p1;
end);
v19.MaxAcceleration = l__MaxAcceleration__8(1080, 0, 0, 0, 1);
spawn(function()
	while v18.Parent.SizeY == 0 do
		wait();	
	end;
	v19:Target(-v18.SizeY);
end);
function v18.Moved()
	if not v19.Tweening then
		v19.x1 = v18.PosOffsetY;
	end;
end;
local v20 = v2.Resizable(v18);
v20.ClipsDescendants = true;
v20.MinY = 240;
local v21 = l__TextBox__5(v20, "Server List");
v21.BackgroundColor = v2.Color1;
v21.TextAlignment = "Center";
v21.SizeScaleX = 1;
v21.SizeOffsetX = -60;
v21.SizeOffsetY = 30;
local v22 = l__TextBox__5(v20, "C");
v22.TextAlignment = "Center";
v22.TextSize = 12;
v22.SizeOffsetX = 30;
v22.SizeOffsetY = 30;
v22.PosScaleX = 1;
v22.PosOffsetX = -60;
local l__IsFreeingMouse__4 = v2.IsFreeingMouse;
local l__FreeMouse__5 = v2.FreeMouse;
function v22.Button1Down()
	local v23 = not l__IsFreeingMouse__4("ServerList");
	l__FreeMouse__5("ServerList", v23);
	if v23 then
		v22.Text = "C";
		return;
	end;
	v22.Text = "^";
end;
local v24 = l__TextBox__5(v20, "x");
v24.TextAlignment = "Center";
v24.TextSize = 12;
v24.SizeOffsetX = 30;
v24.SizeOffsetY = 30;
v24.PosScaleX = 1;
v24.PosOffsetX = -30;
local u6 = nil;
function v24.Button1Down()
	u6();
end;
v2.DragBar(v21, v18);
local v25 = { "Server", "Server Age", "Map", "Changed Map", "Players" };
local v26 = l__New__3(v20);
v26.PosOffsetY = 60;
v26.SizeScaleX = 1;
v26.SizeOffsetY = 20;
v26.DrawBackground = false;
local v27 = {};
for v28 = 1, #v25 do
	local v29 = l__TextBox__5(v26, v25[v28]);
	v29.TextAlignment = "Center";
	v29.SizeScaleY = 1;
	v29.SizeOffsetX = v29.TextSizeX + 10;
	v27[v28] = v29;
end;
local v30 = l__New__3(v20);
v30.DrawBackground = false;
v30.SizeScaleX = 1;
v30.SizeScaleY = 1;
v30.PosOffsetY = 80;
v30.SizeOffsetY = -80;
local v31 = l__New__3();
v2.Scroll(v31, v30);
local v32 = l__New__3(v20);
v32.SizeScaleX = 1;
v32.SizeOffsetY = 30;
v32.PosOffsetY = 30;
v32.DrawBackground = false;
local v33 = v2.TextBox(v32, "Teleport to Place");
v33.PosOffsetY = 5;
v33.SizeOffsetX = v33.TextSizeX + 10;
v33.PosOffsetX = 5;
v33.SizeOffsetY = 20;
local function u7(p2, p3, p4)
	local v34 = 1 - p4;
	return l__Color__1(p2.r * v34 + p3.r * p4, p2.g * v34 + p3.g * p4, p2.b * v34 + p3.b * p4, p2.a * v34 + p3.a * p4);
end;
function v33.Fade(p5)
	v33.BackgroundColor = u7(v2.Color0, v2.Color1, p5);
end;
function v33.Button1Down()
	l__TeleportService__17:Teleport(u3);
end;
v33.Visible = u3 ~= l__PlaceId__15;
local u8 = nil;
local function u9()
	l__Call__2("GetServerList", u3);
end;
v10.Add("SetGamePlaces", function(p6, p7, p8)
	u8 = v2.Dropdown(v32, p7, function(p9)
		u3 = p6[p9];
		v33.Visible = u3 ~= l__PlaceId__15;
		u9();
	end, p8);
	u8.PosOffsetX = 5;
	u8.PosOffsetY = 5;
	u8.SizeOffsetY = 20;
	u8.SizeOffsetX = u8.GetWidth() + 10;
	v33.PosOffsetX = u8.PosOffsetX + u8.SizeX + 5;
end);
l__Call__2("GetGamePlaces");
local l__tostring__10 = tostring;
v10.Add("SetServerID", function(p10)
	v21.Text = "Server List (This server: " .. l__tostring__10(p10) .. ")";
end);
l__Call__2("GetServerID");
local v35 = v2.TextBox(v32, "Refresh");
v35.PosOffsetY = 5;
v35.PosScaleX = 1;
v35.SizeOffsetX = v35.TextSizeX + 10;
v35.PosOffsetX = -5 - v35.SizeX;
v35.SizeOffsetY = 20;
function v35.Fade(p11)
	v35.BackgroundColor = u7(v2.Color0, v2.Color1, p11);
end;
v35.Button1Down = u9;
local u11 = {};
local l__math_max__12 = math.max;
local u13 = nil;
local u14 = { function(p12)

	end };
local u15 = { function(p13)
		return "Meme";
	end };
local l__math_min__16 = math.min;
local l__os_time__17 = os.time;
local l__math_floor__18 = math.floor;
local u19 = {
	[52250025] = true, 
	[467315479] = true
};
local u20 = false;
local function u21(p14, p15, p16)
	if u13 then
		u13:Remove();
	end;
	local v36 = l__New__3();
	local v37 = 0;
	local v38 = {};
	local v39 = false;
	for v40 = 1, #u14 do
		local v41 = u15[v40](p14);
		if v41 then
			v39 = true;
			local v42 = l__TextBox__5(v36, v41);
			v42.TextAlignment = "Center";
			v42.BackgroundColor = v2.Color0;
			v37 = l__math_max__12(v37, 10 + v42.TextSizeX);
			v42.SizeScaleX = 1;
			v42.SizeOffsetY = 20;
			v42.PosOffsetY = 20 * #v38;
			local u22 = u14[v40];
			function v42.Button1Down()
				if p14 then
					u22(p14);
				end;
				v36:Remove();
				u13 = nil;
			end;
			function v42.Fade(p17)
				v42.BackgroundColor = u7(v2.Color0, v2.Color2, p17);
			end;
			v38[#v38 + 1] = v42;
		end;
	end;
	if not v39 then
		v36:Remove();
		return;
	end;
	v36.SizeOffsetX = v37;
	v36.SizeOffsetY = 20 * #v38;
	v36.PosOffsetX = l__math_max__12(0, l__math_min__16(v36.Parent.SizeX - v36.SizeX, p15));
	v36.PosOffsetY = l__math_max__12(0, l__math_min__16(v36.Parent.SizeY - v36.SizeY, p16));
	function v36.MouseLeave()
		v36:Remove();
		u13 = nil;
	end;
	u13 = v36;
end;
u6 = function()
	u20 = false;
	l__FreeMouse__5("ServerList", false);
	v19:Target(-v18.SizeY, function()
		for v43 = 1, #u11 do
			u11[v43]:Remove();
		end;
		v18.Visible = false;
	end);
end;
local l__table_sort__23 = table.sort;
local function u24(p18, p19)
	local v44 = l__New__3(v31);
	v44.SizeScaleX = 1;
	v44.SizeOffsetY = 30;
	local v45 = l__TextBox__5(v44, p19.ServerType == 2 and p19.ServerOwnerName .. "'s Scripted Server" or (p19.ServerType == 1 and p19.ServerOwnerName .. "'s Private Server" or "Public Server " .. p19.ID));
	v45.DrawBackground = false;
	v45.TextAlignment = "Center";
	v45.SizeScaleY = 1;
	v45.SizeOffsetX = v45.TextSizeX + 10;
	v45.PosOffsetX = 0;
	v44[1] = v45;
	local v46 = 0 + v45.SizeX;
	local v47 = l__TextBox__5(v44, "yes");
	v47.DrawBackground = false;
	v47.SizeOffsetX = 30;
	v47.SizeScaleY = 1;
	v47.PosOffsetX = v46;
	function v47.Think()
		if p19.MapTime then
			local v48 = l__os_time__17() - p19.StartTime;
			if v48 < 0 then
				v48 = 0;
			end;
			if v48 < 60 then
				local v49 = "second";
				local v50 = 1;
			elseif v48 < 3600 then
				v49 = "minute";
				v50 = 60;
			elseif v48 < 86400 then
				v49 = "hour";
				v50 = 3600;
			elseif v48 < 604800 then
				v49 = "day";
				v50 = 86400;
			elseif v48 < 2628000 then
				v49 = "week";
				v50 = 604800;
			elseif v48 < 31536000 then
				v49 = "month";
				v50 = 2628000;
			else
				v49 = "year";
				v50 = 31536000;
			end;
			if v49 then
				local v51 = l__math_floor__18(v48 / v50);
				if v51 == 1 or v49 == "ms" then
					local v52 = "";
				else
					v52 = "s";
				end;
				v47.Text = v51 .. " " .. v49 .. v52;
			end;
		end;
	end;
	v47.Think();
	v44[2] = v47;
	local v53 = v46 + v47.SizeX;
	local v54 = l__TextBox__5(v44, p19.MapName and "[MISSING]");
	v54.DrawBackground = false;
	v54.SizeOffsetX = 30;
	v54.SizeScaleY = 1;
	v54.PosOffsetX = v53;
	v44[3] = v54;
	local v55 = v53 + v54.SizeX;
	local v56 = l__TextBox__5(v44, "hi");
	v56.DrawBackground = false;
	v56.TextAlignment = "Center";
	v56.TextSize = 12;
	v56.SizeScaleY = 1;
	v56.SizeOffsetX = v56.TextSizeX + 10;
	v56.PosOffsetX = v55;
	function v56.Think()
		if p19.MapTime then
			local v57 = l__os_time__17() - p19.MapTime;
			if v57 < 0 then
				v57 = 0;
			end;
			if v57 < 60 then
				local v58 = "second";
				local v59 = 1;
			elseif v57 < 3600 then
				v58 = "minute";
				v59 = 60;
			elseif v57 < 86400 then
				v58 = "hour";
				v59 = 3600;
			elseif v57 < 604800 then
				v58 = "day";
				v59 = 86400;
			elseif v57 < 2628000 then
				v58 = "week";
				v59 = 604800;
			elseif v57 < 31536000 then
				v58 = "month";
				v59 = 2628000;
			else
				v58 = "year";
				v59 = 31536000;
			end;
			if v58 then
				local v60 = l__math_floor__18(v57 / v59);
				if v60 == 1 or v58 == "ms" then
					local v61 = "";
				else
					v61 = "s";
				end;
				v56.Text = v60 .. " " .. v58 .. v61;
			end;
		end;
	end;
	v56.Think();
	v44[4] = v56;
	local v62 = v55 + v56.SizeX;
	local v63 = l__TextBox__5(v44, p19.PlayerList and #p19.PlayerList or "0");
	v63.DrawBackground = false;
	v63.TextAlignment = "Center";
	v63.TextSize = 12;
	v63.SizeScaleY = 1;
	v63.SizeOffsetX = v63.TextSizeX + 10;
	v63.PosOffsetX = v62;
	v44[5] = v63;
	local v64 = v62 + v63.SizeX;
	local v65 = l__New__7(30 * (p18 - 1), function(p20)
		v44.PosOffsetY = p20;
	end);
	v65.MaxAcceleration = l__MaxAcceleration__8(0, 30, 0, 0, 2);
	v44.PY = v65;
	v44.t = p19;
	local v66 = true;
	if p19.ServerOwnerID ~= 0 then
		v66 = true;
		if p19.ServerOwnerID ~= l__userId__16 then
			v66 = u19[l__userId__16];
		end;
	end;
	if v66 then
		function v44.Button1Down()
			if u20 then
				l__Call__2("TeleportToID", p19.ID);
				u6();
			end;
		end;
		function v44.Fade(p21)
			v44.BackgroundColor = u7(v2.Color1, v2.Color2, p21);
		end;
	end;
	function v44.Button2Down(p22, p23)
		u21(v44, v44.PosX + p22 + 1, v44.PosY + p23 + 1);
	end;
	function v44.Removed()
		v65:Remove();
	end;
	return v44;
end;
local function u25()
	local v67 = {};
	for v68 = 1, #v27 do
		v67[v68] = v27[v68].TextSizeX + 10;
	end;
	for v69 = 1, #u11 do
		local v70 = u11[v69];
		v70.PY:Target(30 * (v69 - 1));
		for v71 = 1, #v25 do
			local v72 = v70[v71].TextSizeX + 10;
			if v67[v71] < v72 then
				v67[v71] = v72;
			end;
		end;
	end;
	local v73 = { 0 };
	for v74 = 1, #v25 do
		local v75 = v67[v74];
		local v76 = v73[v74];
		v73[v74 + 1] = v76 + v75;
		local v77 = v27[v74];
		v77.SizeOffsetX = v75;
		v77.PosOffsetX = v76;
	end;
	v31.SizeOffsetX = v73[#v73];
	v31.SizeOffsetY = #u11 * 30;
	v20.MinX = l__math_max__12(v73[#v73], v21.TextSizeX + 70);
	for v78 = 1, #u11 do
		local v79 = u11[v78];
		for v80 = 1, #v25 do
			local v81 = v79[v80];
			v81.SizeOffsetX = v67[v80];
			v81.PosOffsetX = v73[v80];
		end;
	end;
end;
v10.Add("SetServerList", function(p24)
	if not p24 then
		print("[ServerList] Received no server list!");
		return;
	end;
	for v82 = 1, #u11 do
		u11[v82]:Remove();
	end;
	u11 = {};
	if #p24 == 0 then
		v33.Visible = u3 ~= l__PlaceId__15;
	else
		v33.Visible = false;
		l__table_sort__23(p24, function(p25, p26)
			if not p25 or not p26 then
				return;
			end;
			if not p25.PlayerList or not p26.PlayerList then
				if p25.ServerOwnerID == p26.ServerOwnerID then
					local v83 = true;
					if not (p25.ID < p26.ID) then
						v83 = p25.ServerOwnerID < p26.ServerOwnerID;
					end;
				else
					v83 = p25.ServerOwnerID < p26.ServerOwnerID;
				end;
				return v83;
			end;
			if p25.ServerOwnerID == p26.ServerOwnerID and #p25.PlayerList == #p26.PlayerList then
				local v84 = true;
				if not (p25.ID < p26.ID) then
					if p25.ServerOwnerID == p26.ServerOwnerID then
						v84 = true;
						if not (#p26.PlayerList < #p25.PlayerList) then
							v84 = p25.ServerOwnerID < p26.ServerOwnerID;
						end;
					else
						v84 = p25.ServerOwnerID < p26.ServerOwnerID;
					end;
				end;
			elseif p25.ServerOwnerID == p26.ServerOwnerID then
				v84 = true;
				if not (#p26.PlayerList < #p25.PlayerList) then
					v84 = p25.ServerOwnerID < p26.ServerOwnerID;
				end;
			else
				v84 = p25.ServerOwnerID < p26.ServerOwnerID;
			end;
			return v84;
		end);
		for v85 = 1, #p24 do
			u11[v85] = u24(v85, p24[v85]);
		end;
	end;
	u25();
end);
local function u26()
	v22.Text = "C";
	u20 = true;
	v18.Visible = true;
	l__FreeMouse__5("ServerList", true);
	v19:Target(v18.Parent.SizeY / 2 - v18.SizeY / 2);
end;
v9.Add("OpenServerList", function()
	if not u20 then
		u9();
		u26();
	end;
end);
v14.Add("serverlist", {}, function()
	u20 = not u20;
	if not u20 then
		u6();
		return;
	end;
	u9();
	u26();
end);
return true;

