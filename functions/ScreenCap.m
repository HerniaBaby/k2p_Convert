function imgData = ScreenCap(monitorNumber)
    % Java Robotを利用してスクリーンショットを撮る
    % monitorNumber: スクリーンショットを撮るモニターの番号（1からスタート）

    arguments
        monitorNumber = 1;
    end

    %% モニターの選択(マルチモニター用)
    % GraphicsEnvironmentを取得
    ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment();

    % 利用可能なモニターのデバイスを取得
    gs = ge.getScreenDevices();

    % 指定したモニターの数が存在しない場合はエラーメッセージを表示
    if monitorNumber > length(gs) || monitorNumber < 1
        error('モニター番号が無効です。存在するモニターの数は %d です。', length(gs));
    end

    % 選択したモニターのGraphicsDeviceを取得
    gd = gs(monitorNumber);

    %% スクリーンショット
    % モニターの画面サイズを取得
    bounds = gd.getDefaultConfiguration().getBounds();

    % Robotインスタンスを作成
    robot = java.awt.Robot();

    % スクリーンショットを撮影
    cap = robot.createScreenCapture(bounds);

    %% 変換
    % Convert to an RGB image
    rgb = typecast(cap.getRGB(0,0,cap.getWidth,cap.getHeight,[],0,cap.getWidth),'uint8');
    imgData = zeros(cap.getHeight,cap.getWidth,3,'uint8');
    imgData(:,:,1) = reshape(rgb(3:4:end),cap.getWidth,[])';
    imgData(:,:,2) = reshape(rgb(2:4:end),cap.getWidth,[])';
    imgData(:,:,3) = reshape(rgb(1:4:end),cap.getWidth,[])';
end