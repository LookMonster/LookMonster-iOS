import UIKit
import DesignSystem
import SnapKit
import ResourceKit
import Then

open class MonsterTrendingKeywordTableViewCell: UITableViewCell {
    static public var id: String {
        NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
    
    static public let cellHeight = 320.0
    
    private lazy var subCategoryList: [MonsterTrendingKeyword] = [
        MonsterTrendingKeyword(id: 1, name: "반팔", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMjY0/MDAxNjg1NDM0NjM5MjQ1.XaATmir_qbj-dvZ9OqRtvpgVNyXVKLxAGOFHLnJSC-kg.MCeNg9LTh6dRpyTSJu6gjfDrDbBZCdjSk4jj2XBFEvAg.PNG/a_tmp_file_38cb5ce0523d4e6caba2208a77c2e6c2.png?type=s"),
        MonsterTrendingKeyword(id: 2, name: "키링", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMjE0/MDAxNjg1NDI0MTg4MzE5.i_h6z8vfl9U57jodM7BWq7QeeIlOaljRKxemY6eulsMg.aDekxXV5h6TTnQRevRG9OYGGUgP30pPJEA7ctA5SLfAg.PNG/a_tmp_file_fa72fc76b3154aa486a9616377d4c593.png?type=s"),
        MonsterTrendingKeyword(id: 3, name: "살로몬", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfNTcg/MDAxNjg1NDEzNzg5OTgz.iCzFmO6r62gUIZenJjJZ_lKdHreofKkKr3f9r-OEjnUg.RiTHaMEQs9lIPNgo48NKR8Vh4RGYqzb9DZP3f6XmspEg.PNG/a_9c5e4e9795324edb95ecba5a0787b216.png?type=s"),
        MonsterTrendingKeyword(id: 4, name: "스투시", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMTEy/MDAxNjg1NDMzODEyOTQx.h_HAvVHMhkaIOnig3SGEgQ3RCzmsiSPx7WrecI38_jAg.q3e3Qdj2LYz2IZNVlhwGjC6jLjzCUCWnc73qBOItCdAg.PNG/a_tmp_file_c642a33eb8594d7a8daf1cf5ac8eec4f.png?type=s"),
        MonsterTrendingKeyword(id: 5, name: "향수", imgUrl: "https://kream-phinf.pstatic.net/MjAyMjEwMjZfOTcg/MDAxNjY2NzUwMTIxNzE0.0aonTLDsAjq8_bugE55LU4bSVnoMnb6pn9JX2ZijEk0g.4kl967Kh3C_o2RQ7pUw9-EqWspqE5kQP_QRyWm_l9sMg.PNG/a_36083db2e2b646d88df281ccb3b183d4.png?type=s"),
        MonsterTrendingKeyword(id: 6, name: "반스", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfNDAg/MDAxNjg1NDM0NjY2MzA0.C9TINvz9X_MlE8gE5bvPdoHPN_k7CCuh6NJBwVAEZZ0g.Cx54YoB5hNO76oi-39_6ui8h1_wVe6B5CPMghDjom_og.PNG/a_tmp_file_2c28bd40162149ba9efa3bde3e5ead35.png?type=s"),
        MonsterTrendingKeyword(id: 7, name: "슈프림", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMjQ5/MDAxNjg1NDM0MDM0NDU4.zHUN64seboMIPXLPMoe52pU4hJbG7-f67-qa_47tVy8g.Ub4C8ric4jPRAK1B4NjC3MqqlTc7wyrDek61iIEIQk4g.PNG/a_tmp_file_4ec7281687484662950fa815336c9430.png?type=s"),
        MonsterTrendingKeyword(id: 8, name: "휴먼 메이드", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMzEg/MDAxNjg1NDMzOTI2Mzg4.DbysjSt-DZWx4KqQt4zL4bHr_sK_3mDWDjhi8ZtNWjwg.mMktTHeZqJ4sGi28cQgvwFE0u8nE3sa2nkzO6Rnzftcg.PNG/a_tmp_file_a1a75e925ebd4815b2ddb89ec36e8820.png?type=s"),
        MonsterTrendingKeyword(id: 9, name: "샤넬", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMTYw/MDAxNjg1NDM0MjE5ODc5.1ZoxrZrHsjTIb2JVUjUa_2pfTr4vl-j0tW7C7uoMEgcg.KKcgQAEKgWW-IUvmTfU6EeounQTHL7zcOdRCvmaPZyEg.PNG/a_tmp_file_93596ee8ee8846f08e78c9135e031b4f.png?type=s"),
        MonsterTrendingKeyword(id: 10, name: "가니", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfOTkg/MDAxNjg1NDM0MjQ2MTAx.-1CDd4PE5MEwI9xgGhHFf1PnTknZGbxnVh3boHMPvMAg._WD6XA_f6AZ1h-uf2Bi6cXaxhJwf1gyOoRVnRlmhweEg.PNG/a_tmp_file_85e6b54f42444091b438945c4c0899a4.png?type=s"),
        MonsterTrendingKeyword(id: 11, name: "아식스", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzAzMjNfMTEg/MDAxNjc5NTQ4ODgyODM4.ek5Yei2OXzyT53br7EQByqtu9onvKs9QI6pwsOeUpggg.I5V6UyqRY18uwVTmkL35AuIuYxXVcvvxBbrhrYBj9sEg.PNG/a_7a1192ab6bad41e680a98d8134013819.png?type=s"),
        MonsterTrendingKeyword(id: 12, name: "목걸이", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzAzMTVfMjYw/MDAxNjc4ODczODg2MDIz.0RJITNQuuB9YyZbPKp43in6KswfuVszM2OKKPEpBt5Ug.-55gg_OQGnU9ZZW1Ty4iDKBfTQF9WfmNKSzpqIRv1UMg.PNG/a_c80c1e40e8864f389f0be4602d9c6ab9.png?type=s"),
        MonsterTrendingKeyword(id: 13, name: "아더에러", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MjVfMTY3/MDAxNjg1MDAzNDMzNjEw.Czo35HFLoGZQB90YIaxodBkzIfXdZiNO3nZRNcF8r6sg.5AITp-FQaEDQ7o3FVunZ1WQWohuYY6ZpnU0DaTQFWP4g.PNG/a_21065b6500264d71ba017ebc2f0492b6.png?type=s"),
        MonsterTrendingKeyword(id: 14, name: "애플", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMTQw/MDAxNjg1NDM0ODA2NDIw.6ZP20NT9Nz1hL9-PAFuprrLprDdnAXZhIh1MM3iVEt0g.sDn8ZndE-DxgO7iPWQP8gR6aK_JpBlbQCVnN1LELevMg.PNG/a_tmp_file_bb5fd1dc31fd47cf9677c46a5d0d9fd5.png?type=s"),
        MonsterTrendingKeyword(id: 15, name: "선글라스", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MDhfMjU0/MDAxNjgzNTQ5MTUyMjIx.EmM6b2bPc3c2tdv6lkelDWY67g2rzKtxPx68iq38njkg.dgEatJMuSLYTqA24aqA8GaDTWRsTtUec8ZHj_2N9fAMg.PNG/a_tmp_file_d96b4b993f1942b1ae862c74a6beea91.png?type=s"),
        MonsterTrendingKeyword(id: 16, name: "코스", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzAzMDhfMjIx/MDAxNjc4MjM5MDk4OTYz.q-0ku7PQPy3uYuj3MwONeGSA1D_H1ziTUao1cdNvvKEg.08tnO1iCwHg-cJlDktSt-0DslQyEWnXQYFQd1cu_KVIg.PNG/a_46600b21e9f64bcf8364cc8cd9750fa8.png?type=s"),
        MonsterTrendingKeyword(id: 17, name: "백팩", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMjk5/MDAxNjg1NDM0ODU3NDUw.Z-lqteab_8htOLHK05hTXaii5QLZqkgd81ssbwPCNC4g.-33GNlSjjInIs4i5n1YTNEt7XgbSLINVU3J2kYzuzysg.PNG/a_tmp_file_6070ca5bd2924a83b6ef3f7a30cdc299.png?type=s"),
        MonsterTrendingKeyword(id: 18, name: "LP", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfNjQg/MDAxNjg1NDM0NTYwMTc2.7OypZTvyZeH5JZWW-4q7WdCVCNHPvbWe4yI0jn1D5l8g.MfcNEjCWFlbmpWssm3tDVR6Nf5vmyZTytPvkaPLBMr0g.PNG/a_tmp_file_9c6daf330d834021b936e78869d3de3a.png?type=s"),
        MonsterTrendingKeyword(id: 19, name: "스니커즈", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MjZfMjgw/MDAxNjg1MDY2OTczNDg1.iMMYzA6ozpz2pKZ8c-stXkWd5QLuhzjr3wCGTs6CZN0g.Ec_Sk5rR9da2AtCwaA-d1mK2dE5ZL-slpMZxHyzz24wg.PNG/a_a645e508001d4aed9298aa3bafb1bf56.png?type=s"),
        MonsterTrendingKeyword(id: 20, name: "더보기", imgUrl: "https://kream-phinf.pstatic.net/MjAyMzA1MzBfMjY0/MDAxNjg1NDM0NjM5MjQ1.XaATmir_qbj-dvZ9OqRtvpgVNyXVKLxAGOFHLnJSC-kg.MCeNg9LTh6dRpyTSJu6gjfDrDbBZCdjSk4jj2XBFEvAg.PNG/a_tmp_file_38cb5ce0523d4e6caba2208a77c2e6c2.png?type=s")
    ]
    
    private lazy var subCategoryCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MonsterTrendingKeywordCollectionViewCell.self, forCellWithReuseIdentifier: MonsterTrendingKeywordCollectionViewCell.id)
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = (subCategoryList.count - 1) / 10 + 1
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .darkGray
        return pageControl
    }()
    
    private func configureUI() {
        self.contentView.addSubview(subCategoryCollectionView)
        self.contentView.addSubview(pageControl)
        subCategoryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(40)
            $0.height.equalTo(240)
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subCategoryCollectionView.snp.bottom).offset(8)
        }
    }
    
    open func setUp() {
        self.configureUI()
    }
}

extension MonsterTrendingKeywordTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategoryList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonsterTrendingKeywordCollectionViewCell.id, for: indexPath) as? MonsterTrendingKeywordCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.model = subCategoryList[indexPath.item]
        cell.setUp()
        return cell
    }
}

extension MonsterTrendingKeywordTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 5
        let width: CGFloat = (collectionView.bounds.width - itemSpacing * 4) / 5
        let height: CGFloat = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MonsterTrendingKeywordTableViewCell: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let xVal = scrollView.contentOffset.x + (width / 2)

        let newPage = Int(xVal / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
