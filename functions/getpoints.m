function pos = getpoints(monitorNumber)

    %% モニター番号
    arguments
        monitorNumber = 1;
    end

    %% スクリーンショット & 描写
    % スクリーンショットを取る
    imgData = ScreenCap(monitorNumber);

    % 全画面で表示
    drawFigure(imgData);
    
    %% ROI Check
    % メッセージを表示
    uiwait(msgbox(["　ClickしてドラッグでROI作成";"";"　ダブルクリックで範囲決定"]));

    % マウスで四角形を描画
    h = images.roi.Rectangle(gca, 'StripeColor', 'r');  % 赤い線で四角形を描画
    draw(h);                                            % 四角形をインタラクティブに描画可能にする

    % ユーザーがROIを配置した後、位置情報を取得
    wait(h);                                            % ユーザーが四角形を配置し終えるのを待つ
    pos = h.Position;                                   % 四角形の位置を取得[xmin, ymin, width, height]

    % figureを閉じる
    close

    % メッセージを表示
    % uiwait(msgbox(sprintf("範囲\n[xmin: %d, ymin: %d, width: %d, height: %d]", ...
    %     round(pos(1)),round(pos(2)),round(pos(3)),round(pos(4)))));
end