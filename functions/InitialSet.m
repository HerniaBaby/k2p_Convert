function output = InitialSet()

    % 1. ページ番号を入力するためのメッセージボックス
    prompt = {'移動したいページ番号を入力してください:'};
    dlgtitle = 'ページ番号の指定';
    dims = [1 35];
    definput = {'1'};
    answer = inputdlg(prompt, dlgtitle, dims, definput);

    % 入力されたページ番号を取得
    if ~isempty(answer)
        pageNumber = str2double(answer{1});
        disp(['指定されたページ番号: ', num2str(pageNumber)]);
    else
        disp('ページ番号が入力されませんでした。');
        pageNumber = [];  % ページ番号が入力されなかった場合は空にする
    end

    % 2. 右か左か選択するためのダイアログボックス
    direction = questdlg('どちらの方向にページを移動しますか?', ...
        'ページ移動方向', ...
        '右', '左', 'キャンセル', '右');

    % 選択結果を表示
    switch direction
        case '右'
            disp('選択された方向: 右');
        case '左'
            disp('選択された方向: 左');
        case 'キャンセル'
            disp('操作がキャンセルされました。');
            direction = '';  % キャンセルされた場合は空にする
    end

    % 結果を変数として出力
    output.pageNumber = pageNumber;
    output.direction = direction;

end