function drawFigure(I)
    %ディスプレイサイズ取得
    dhisplay = groot;
    x = dhisplay.ScreenSize();

    % 図示
    imshow(I);

    % ハンドルの取得
    hFig = gcf;
    hAx  = gca;

    % Figureをフルスクリーンにする
    set(hFig,'units','normalized','outerposition',[0 0 1 1]);

    % axesをフルスクリーンにする
    set(hAx,'Unit','normalized','Position',[0 0 1 1]);

    % ツールバーを隠す
    set(hFig,'menubar','none')

    % タイトルを消す
    set(hFig,'NumberTitle','off');

    % 背景は白
    set(hFig,'Color','w')

    % フルスクリーン
    set (hFig,'WindowState','fullscreen')
end