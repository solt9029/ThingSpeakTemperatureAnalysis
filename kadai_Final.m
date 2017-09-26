%% 4組24番　塩出研史
% kadai_Final

%% 変数データを削除
clear

%% 利用するチャンネル番号を指定する
CHANNEL_NUM=38265;

%% データを取ってくる（インドア気温・アウトドア気温・相対湿度・暑さ指標）
[~,~,channelInfo]=thingSpeakRead(CHANNEL_NUM);

[data,timestamps]=thingSpeakRead(CHANNEL_NUM,'NumDays',1);
indoor=data(:,1);
outdoor=data(:,2);
relative_humidity=data(:,3);
heat_index=data(:,4);

%% 4種類のグラフを個別に描画する
figure
plot(timestamps,indoor)
title(sprintf('ThingSpeak Channel %d\n%s',channelInfo.ChannelID,channelInfo.Name))
xlabel('Time')
ylabel('Temp')
legend(channelInfo.FieldDescriptions{1})
datetick

figure
plot(timestamps,outdoor)
title(sprintf('ThingSpeak Channel %d\n%s',channelInfo.ChannelID,channelInfo.Name))
xlabel('Time')
ylabel('Temp')
legend(channelInfo.FieldDescriptions{2})
datetick

figure
plot(timestamps,relative_humidity)
title(sprintf('ThingSpeak Channel %d\n%s',channelInfo.ChannelID,channelInfo.Name))
xlabel('Time')
ylabel('Humidity')
legend(channelInfo.FieldDescriptions{3})
datetick

figure
plot(timestamps,heat_index)
title(sprintf('ThingSpeak Channel %d\n%s',channelInfo.ChannelID,channelInfo.Name))
xlabel('Time')
ylabel('Heat')
legend(channelInfo.FieldDescriptions{4})
datetick

%% 4種類のグラフを1つのウィンドウ内に描画する
figure
title(sprintf('ThingSpeak Channel %d\n%s',channelInfo.ChannelID,channelInfo.Name))
subplot(4,1,1)
plot(timestamps,indoor,'b')
datetick
ylabel('Temp')
legend(channelInfo.FieldDescriptions{1})

subplot(4,1,2)
plot(timestamps,outdoor,'r')
datetick
ylabel('Temp')
legend(channelInfo.FieldDescriptions{2})

subplot(4,1,3)
plot(timestamps,relative_humidity,'g')
datetick
ylabel('Humidity')
legend(channelInfo.FieldDescriptions{3})

subplot(4,1,4)
plot(timestamps,heat_index,'y')
datetick
ylabel('Heat')
legend(channelInfo.FieldDescriptions{4})

%% アウトドア気温と暑さ指標の相関を見てみる
figure
plot(outdoor,heat_index,'*')
lsline % 回帰直線を表示する
xlabel('outdoor')
ylabel('heat_index')

R_oh=corr2(outdoor,heat_index)

%% インドア気温とアウトドア気温の比較
figure
plot(indoor,outdoor,'*')
xlabel('indoor')
ylabel('outdoor')

R_io=corr2(indoor,outdoor)

%% 暑さ指標と相対湿度の比較
figure
plot(heat_index,relative_humidity,'*')
xlabel('heat_index')
ylabel('relative_humidity')

R_hr=corr2(heat_index,relative_humidity)

%% レポート内容・考察・まとめ
%{
最終課題として、課題2を選択した。
ThingSpeakを利用し、データを取得し可視化することによって関係性を把握することが本レポート・プログラムの目的である。
利用したThingSpeakのセンシングデータではTemperature and humidity in Antonovoを示している。
データの中にはインドアの気温・アウトドアの気温・相対湿度・暑さ指標の4種類のデータが含まれている。
暑さ指標は気温だけでなく湿度など色々な要因を考えたものである。
しかしながら、可視化した結果として、暑さ指標はやはりアウトドア気温に大きな影響を受けるということが感じ取れた。
実際に相関係数をcorr2を用いて計算したところ0.9952という数値が得られた。
また、インドア気温とアウトドア気温には関係性が観察されないことが分かった。
同様に暑さ指標と相対湿度にも関係性はあまり観察されなかった。
%}