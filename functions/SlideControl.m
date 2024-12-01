function SlideControl(robot, BookDirection)

    arguments
        robot = java.awt.Robot();
        BookDirection = "右";
    end

    if BookDirection == "右"
        robot.keyPress(java.awt.event.KeyEvent.VK_RIGHT);   % 右矢印キーを押す
        robot.keyRelease(java.awt.event.KeyEvent.VK_RIGHT); % 右矢印キーを離す
    elseif BookDirection == "左"
        robot.keyPress(java.awt.event.KeyEvent.VK_LEFT);   % 左矢印キーを押す
        robot.keyRelease(java.awt.event.KeyEvent.VK_LEFT); % 左矢印キーを離す
    else
        error('引数が無効です。R/Lで選んでください。');
    end
end