% obj=videoinput('kinect',1);
% obj.ReturnedColorspace = 'rgb';
% colorDevice = imaq.VideoDevice('kinect',1)
% colorDevice.ReturnedDataType = 'uint8';


myKinect = imaq.VideoDevice('kinect', 1);
vidInfo = imaqhwinfo(myKinect);
myVideo = vision.VideoPlayer;
