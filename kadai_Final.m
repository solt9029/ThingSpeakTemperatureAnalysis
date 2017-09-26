%% 4�g24�ԁ@���o���j
% kadai_Final

%% �ϐ��f�[�^���폜
clear

%% ���p����`�����l���ԍ����w�肷��
CHANNEL_NUM=38265;

%% �f�[�^������Ă���i�C���h�A�C���E�A�E�g�h�A�C���E���Ύ��x�E�����w�W�j
[~,~,channelInfo]=thingSpeakRead(CHANNEL_NUM);

[data,timestamps]=thingSpeakRead(CHANNEL_NUM,'NumDays',1);
indoor=data(:,1);
outdoor=data(:,2);
relative_humidity=data(:,3);
heat_index=data(:,4);

%% 4��ނ̃O���t���ʂɕ`�悷��
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

%% 4��ނ̃O���t��1�̃E�B���h�E���ɕ`�悷��
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

%% �A�E�g�h�A�C���Ə����w�W�̑��ւ����Ă݂�
figure
plot(outdoor,heat_index,'*')
lsline % ��A������\������
xlabel('outdoor')
ylabel('heat_index')

R_oh=corr2(outdoor,heat_index)

%% �C���h�A�C���ƃA�E�g�h�A�C���̔�r
figure
plot(indoor,outdoor,'*')
xlabel('indoor')
ylabel('outdoor')

R_io=corr2(indoor,outdoor)

%% �����w�W�Ƒ��Ύ��x�̔�r
figure
plot(heat_index,relative_humidity,'*')
xlabel('heat_index')
ylabel('relative_humidity')

R_hr=corr2(heat_index,relative_humidity)

%% ���|�[�g���e�E�l�@�E�܂Ƃ�
%{
�ŏI�ۑ�Ƃ��āA�ۑ�2��I�������B
ThingSpeak�𗘗p���A�f�[�^���擾���������邱�Ƃɂ���Ċ֌W����c�����邱�Ƃ��{���|�[�g�E�v���O�����̖ړI�ł���B
���p����ThingSpeak�̃Z���V���O�f�[�^�ł�Temperature and humidity in Antonovo�������Ă���B
�f�[�^�̒��ɂ̓C���h�A�̋C���E�A�E�g�h�A�̋C���E���Ύ��x�E�����w�W��4��ނ̃f�[�^���܂܂�Ă���B
�����w�W�͋C�������łȂ����x�ȂǐF�X�ȗv�����l�������̂ł���B
�������Ȃ���A�����������ʂƂ��āA�����w�W�͂�͂�A�E�g�h�A�C���ɑ傫�ȉe�����󂯂�Ƃ������Ƃ�������ꂽ�B
���ۂɑ��֌W����corr2��p���Čv�Z�����Ƃ���0.9952�Ƃ������l������ꂽ�B
�܂��A�C���h�A�C���ƃA�E�g�h�A�C���ɂ͊֌W�����ώ@����Ȃ����Ƃ����������B
���l�ɏ����w�W�Ƒ��Ύ��x�ɂ��֌W���͂��܂�ώ@����Ȃ������B
%}