ch1=1:72;
ch2=73:90;
f1=@(v)(1-0.006).^v;
kin1=arrayfun(f1,ch1);
j=@(v)0.006+((1-0.006)./18).*(v-72);
j1=arrayfun(j,ch2);
j2=kin1(72);
j3=cumprod(1-j1);
kin2=j2.*j3;
kin=100.*[kin1 kin2];
cho=[ch1 ch2];
figure
plot(cho,kin,'b-',72,kin(72),'r*')
title('Genshin Impact Character Supplication\newlineProbability of Not Getting 5-star Character (100%-Cummulative Density Function) ')
xticks([1:90]);
yticks([0:5:100]);
yticklabels({'0%','5%','10%','15%','20%','25%','30%','35%','40%','45%',...
    '50%','55%','60%','65%','70%','75%','80%','85%','90%','95%','100%',})
xlabel('Supplication Times')
ylabel('Probability of Still Not Getting 5-star Character')

figure
singlech=[0.006.*ones(1,72) j1];
pdfch=[100,kin(1:89)].*singlech;
plot(cho,pdfch)
title('Probability Density Function of Genshin Impact Character Supplication')
xticks([1:90]);
yticks([0:11]);
yticklabels({'0%','1%','2%','3%','4%','5%','6%','7%','8%','9%','10%','11%'})
xlabel('Supplication Times')
ylabel('Probability of Getting 5-star Character at this Point')

Expectation=dot(cho,pdfch./100)
Average=1./Expectation
sum(pdfch)
