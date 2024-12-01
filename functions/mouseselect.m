function mouseselect(robot,x,y,monitorNumber)

    arguments
        robot = java.awt.Robot();
        x = 300;
        y = 300;
        monitorNumber = 2;
    end

    [~] = ScreenCap(monitorNumber);

    % マウス移動
    robot.mouseMove(x, y);
    % マウス左クリック
    robot.mousePress(java.awt.event.InputEvent.BUTTON1_MASK);
    robot.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);

end