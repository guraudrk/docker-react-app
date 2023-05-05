# as builder는 '여기부터 일정 부분은 빌더 부분이다' 라고 선언하는 것과 같다.

FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

#빌드 파일이 생성이 되었다면 이제 nginx를 생성한다.

FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

